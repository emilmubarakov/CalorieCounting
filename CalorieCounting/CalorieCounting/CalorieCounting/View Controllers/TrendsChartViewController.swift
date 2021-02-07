//
//  TrendsChartViewController.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 5.01.2021.
//

//import UIKit
import JBChartView

class TrendsChartViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var totalCaloriesView: TotalCaloriesView!
    @IBOutlet weak var barChartView: JBBarChartView!
    @IBOutlet weak var lastDayLabel: UILabel!
    
    // MARK: - Properties
    var trend = [TrendPoint]() {
        didSet {
            navigationItem.title = "\(trend.count)-day Trends"
        }
    }
    
    private lazy var didRotate: (Notification) -> (Void) = { [weak self] notification in
        self?.reloadChartView()
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureChartView()
        NotificationCenter.default.addObserver(forName: UIDevice.orientationDidChangeNotification, object: nil, queue: .main, using: didRotate)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        barChartView.reloadData(animated: true)
    }
    
    // MARK: - Helpers
    private func configureView() {
        totalCaloriesView.trendPoint = trend.first
        lastDayLabel.text = trend.last?.date.shortDateString
    }
    
    private func configureChartView() {
        barChartView.dataSource = self
        barChartView.delegate = self
        barChartView.maximumValue = 125.0
        barChartView.minimumValue = 0.0
    }
    
    private func reloadChartView() {
        barChartView.reloadData()
    }
}

// MARK: - JBChart view data source
extension TrendsChartViewController: JBBarChartViewDataSource {
    
    func numberOfBars(in barChartView: JBBarChartView!) -> UInt {
        return UInt(trend.count)
    }
}

// MARK: - JBChart view delegate
extension TrendsChartViewController: JBBarChartViewDelegate {
    
    func barChartView(_ barChartView: JBBarChartView!, heightForBarViewAt index: UInt) -> CGFloat {
        return CGFloat(trend[Int(index)].calories)
    }
    
    func barSelectionColor(for barChartView: JBBarChartView!) -> UIColor! {
        return .coreOrange
    }
    
    func barChartView(_ barChartView: JBBarChartView!, colorForBarViewAt index: UInt) -> UIColor! {
        return .coreBlue
    }
    
    func barChartView(_ barChartView: JBBarChartView!, didSelectBarAt index: UInt) {
        totalCaloriesView.trendPoint = trend[Int(index)]
    }
    
    func didDeselect(_ barChartView: JBBarChartView!) {
        totalCaloriesView.trendPoint = trend.first
    }
}
