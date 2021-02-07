//
//  BaseViewController.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 28.12.2020.
//

import UIKit

enum DisplayMode {
    case presenting
    case presented
}

protocol FoodRemovable {
    func removeFoodsFromToday(_ foods: [Food])
}

extension FoodRemovable {
    func removeFoodsFromToday(_ foods: [Food]) {
        foods.forEach({ $0.isConsumedToday = false })
        PersistenceManager.shared.saveContext()
    }
}

class BaseViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet var emptyStateLabel: LargeLabel!
    @IBOutlet weak var topLabelConstraint: NSLayoutConstraint?
    @IBOutlet weak var bottomLabelConstraint: NSLayoutConstraint?
    @IBOutlet weak var leadingLabelConstraint: NSLayoutConstraint?
    @IBOutlet weak var trailingLabelConstraint: NSLayoutConstraint?
    
    // MARK: - Properties
    private var constraints = [NSLayoutConstraint?]()
    var displayMode = DisplayMode.presenting
    var selectedIndexPath = IndexPath()
    var foods: [Food] {
        return [Food]()
    }
    var trend: [TrendPoint] {
        return [TrendPoint]()
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addObservers()
        registerCells()
        configureBarButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureView()
    }
    
    // MARK: - Helpers
    func addObservers() {
        let context = PersistenceManager.shared.conetext
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataSource), name: Notification.Name.NSManagedObjectContextDidSave, object: context)
        NotificationCenter.default.addObserver(self, selector: #selector(reloadDataSource), name: Notification.Name.NSManagedObjectContextObjectsDidChange, object: context)
    }
    
    func registerCells() {
        // implement in subclasses
    }

    func configureBarButtons() {
        // implement in subclasses
    }

    @objc
    func reloadDataSource(){
        configureView()
    }

    func configureView() {
        constraints = [topLabelConstraint, bottomLabelConstraint, leadingLabelConstraint, trailingLabelConstraint]
    }

    func dismiss() {
        dismiss(animated: true, completion: nil)
    }

    func addEmptyStateLabel() {
        emptyStateLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(emptyStateLabel)
        constraints.forEach({ $0?.isActive = true })
    }
    
    func removeEmptyStateLabel() {
        view.removeConstraints(emptyStateLabel.constraints)
        emptyStateLabel.removeFromSuperview()
    }
}
