//
//  TrendsViewController.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 28.12.2020.
//

import UIKit

class TrendsViewController: BaseViewController {
    
    enum SelectedTrend: Int {
        case sevenDays
        case thirtyDays
    }
    
    // MARK: - Outlets
    @IBOutlet weak var trendsCollectionView: UICollectionView!
    @IBOutlet weak var trendSelector: UISegmentedControl!

    // MARK: - Properties
    private var sevenDayFlowLayout = UICollectionViewFlowLayout()
    private var thirtyDayFlowLayout = UICollectionViewFlowLayout()
    private var selectedTrend: SelectedTrend {
        return SelectedTrend(rawValue: trendSelector.selectedSegmentIndex)!
    }
    override var trend: [TrendPoint] {
        switch selectedTrend {
        case .sevenDays:
            return FoodDataSource.shared.dynamicSevenDayTrend
        case .thirtyDays:
            return FoodDataSource.shared.dynamicThirtyDayTrend
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureFlowLayouts()
    }

    // MARK: - Overrides
    override func configureView() {
        super.configureView()
        trend.isEmpty ? addEmptyStateLabel() : removeEmptyStateLabel()
        trendsCollectionView.allowsSelection = true
        trendsCollectionView.reloadData()
    }
    
    private func configureFlowLayouts() {
        sevenDayFlowLayout.minimumInteritemSpacing = 0.0
        sevenDayFlowLayout.minimumLineSpacing = 0.0
        sevenDayFlowLayout.itemSize = CGSize(width: trendsCollectionView.bounds.width, height: 84.0)
        
        let smallWidth = (trendsCollectionView.bounds.width - 18.0)/5
        thirtyDayFlowLayout.minimumInteritemSpacing = 3.0
        thirtyDayFlowLayout.minimumLineSpacing = 3.0
        thirtyDayFlowLayout.itemSize = CGSize(width: smallWidth, height: smallWidth)
        thirtyDayFlowLayout.sectionInset = UIEdgeInsets(top: 0.0, left: 3.0, bottom: 0.0, right: 3.0)
        
        trendsCollectionView.setCollectionViewLayout(sevenDayFlowLayout, animated: false)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case Constant.Identifier.Segue.toToday:
            let navigationVC = segue.destination as? UINavigationController
            let todayVC = navigationVC?.viewControllers.first as? TodayViewController
            todayVC?.displayMode = .presented
            todayVC?.trendPoint = trend[selectedIndexPath.row]
            
        case Constant.Identifier.Segue.toChart:
            let destinationVC = segue.destination as? TrendsChartViewController
            destinationVC?.trend = trend
            
        default:
            break
        }
    }

    // MARK: - Actions
    @IBAction func trendSelectorTapped(_ sender: UISegmentedControl) {
        trendsCollectionView.reloadData()
        switch selectedTrend {
        case .sevenDays:
            trendsCollectionView.setCollectionViewLayout(sevenDayFlowLayout, animated: true)
            
        case .thirtyDays:
            trendsCollectionView.setCollectionViewLayout(thirtyDayFlowLayout, animated: true)
        }
    }
    
    @IBAction func chartButtonTapped(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: Constant.Identifier.Segue.toChart, sender: nil)
    }
}

// MARK: - Collection View Data Source
extension TrendsViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        trend.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier = ""
        switch selectedTrend {
        case .sevenDays:
            identifier = Constant.Identifier.Cell.trendLargeCell
        case .thirtyDays:
            identifier = Constant.Identifier.Cell.trendSmallCell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as? TrendCollectionViewCell else { return UICollectionViewCell() }
        cell.configure(with: trend[indexPath.row])
        return cell
    }
}

// MARK: - Collection View Delegate
extension TrendsViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        performSegue(withIdentifier: Constant.Identifier.Segue.toToday, sender: nil)
    }
}
