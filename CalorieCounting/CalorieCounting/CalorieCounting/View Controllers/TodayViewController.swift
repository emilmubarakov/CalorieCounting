//
//  TodayViewController.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 28.12.2020.
//

import UIKit

class TodayViewController: BaseViewController {

    // MARK: - Outlets
    @IBOutlet weak var todayTableView: UITableView!
    @IBOutlet weak var totalCaloriesView: TotalCaloriesView!
    
    // MARK: - Properties
    var trendPoint: TrendPoint?
    override var foods: [Food] {
        switch displayMode {
        case .presenting:
            return FoodDataSource.shared.todayFoods
        case .presented:
            return FoodDataSource.shared.allFoods(for: trendPoint?.date ?? Date())
        }
    }
    
    // MARK: - Overrides
    override func reloadDataSource() {
        super.reloadDataSource()
        todayTableView.reloadData()
    }
    
    override func configureView() {
        super.configureView()
        todayTableView.isHidden = foods.isEmpty
        todayTableView.allowsSelection = false
        todayTableView.rowHeight = UITableView.automaticDimension
        foods.isEmpty ? addEmptyStateLabel() : removeEmptyStateLabel()
        
        if displayMode == .presented {
            title = trendPoint?.date.shortDateString
            totalCaloriesView.trendPoint = trendPoint
            emptyStateLabel.text = "Nothing to see here!\n\n😊"
        }
        else {
            totalCaloriesView.totalCalories = FoodDataSource.shared.totalTodayCalories
        }
    }
    
    override func registerCells() {
        super.registerCells()
        todayTableView.register(UINib(nibName: Constant.Identifier.Cell.foodCellNib, bundle: nil),
                                forCellReuseIdentifier: Constant.Identifier.Cell.foodCell)
    }
    
    override func configureBarButtons() {
        switch displayMode {
        case .presenting:
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                                target: self,
                                                                action: #selector(addButtonTapped))
            
        case .presented:
            navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel,
                                                               target: self,
                                                               action: #selector(cancelButtonTapped))
        }
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.Identifier.Segue.toFoods {
            let destinationVC = segue.destination as? UINavigationController
            let foodsVC = destinationVC?.viewControllers.first as? FoodsViewController
            foodsVC?.displayMode = .presented
        }
    }
    
    // MARK: - Actions
    @objc
    func cancelButtonTapped() {
        dismiss()
    }
    
    @objc
    func addButtonTapped() {
        performSegue(withIdentifier: Constant.Identifier.Segue.toFoods, sender: nil)
    }
}

extension TodayViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let foodCell = tableView.dequeueReusableCell(withIdentifier: Constant.Identifier.Cell.foodCell, for: indexPath) as? FoodTableViewCell else { return UITableViewCell() }
        foodCell.configure(with: foods[indexPath.row])
        
        return foodCell
    }
}

extension TodayViewController: UITableViewDelegate, FoodRemovable {
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if displayMode == .presenting {
            let food = foods[indexPath.row]
            let addAction = UIContextualAction(style: .normal, title: "Remove") { [weak self] (_, _, completion) in
                self?.removeFoodsFromToday([food])
                completion(true)
            }
            
            addAction.backgroundColor = .coreOrange
            return UISwipeActionsConfiguration(actions: [addAction])
        }
        return nil
    }
}
