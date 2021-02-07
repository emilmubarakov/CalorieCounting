//
//  NewFoodViewController.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 28.12.2020.
//

import UIKit

class NewFoodViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageContainerView: CircularView!
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var addButton: WhiteButton!
    @IBOutlet weak var foodNameTextField: UITextField!
    @IBOutlet weak var foodCaloriesTextField: UITextField!
    @IBOutlet var tapGestureRecognizer: UITapGestureRecognizer!
    
    // MARK: - Properties
    var newFood: Food?
    private let imagePicker = UIImagePickerController()
    private var selectedImage: UIImage? {
        didSet {
            foodImageView.image = selectedImage
            addButton.setTitle(Constant.ButtonTitle.change, for: .normal)
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    // MARK: - Actions
    @IBAction func cancelButtonTapped(_ sender: UIBarButtonItem) {
        dismiss()
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        if let foodName = foodNameTextField.text,
            let caloriesString = foodCaloriesTextField.text,
            let foodCalories = Double(caloriesString),
            let image = selectedImage, let imageData = image.jpegData(compressionQuality: 10) {
            if let food = newFood, FoodDataSource.shared.allFoods.contains(food) {
                food.name = foodName
                food.calories = foodCalories
                food.imageData = imageData
                PersistenceManager.shared.saveContext()
                dismiss()
            }
            else if !FoodDataSource.shared.allFoods.compactMap({ $0.name }).contains({ foodName }()) {
                FoodDataSource.shared.createNewFoodItem(name: foodName, calories: foodCalories, imageData: imageData)
                dismiss()
            }
            else {
                AlertsManager.duplicateNameAlert.show()
            }
        }
        else {
            showInputFeedback()
        }
    }
    
    @IBAction func addImageButtonTapped(_ sender: WhiteButton) {
        dismissKeyboard()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let alert = AlertsManager.photoSelectionAlert
            alert.addAction(withTitle: Constant.Alert.Title.Action.fromPhotoLibrary, style: .default) { [weak self] in
                guard let self = self else { return }
                self.showPhotoLibrary()
            }
            alert.addAction(withTitle: Constant.Alert.Title.Action.usingCamera, style: .default) { [weak self] in
                guard let self = self else { return }
                self.imagePicker.allowsEditing = true
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            
            alert.show(for: sender)
        }
        else {
            showPhotoLibrary()
        }
    }
    
    @IBAction func tapGestureRecognizerTapped(_ sender: UITapGestureRecognizer) {
        sender.isEnabled.toggle()
        dismissKeyboard()
    }
    
    // MARK: - Helpers
    private func configure() {
        tapGestureRecognizer.isEnabled = false
        foodNameTextField.delegate = self
        foodCaloriesTextField.delegate = self
        imagePicker.delegate = self
        
        foodNameTextField.text = newFood?.name
        if let calories = newFood?.calories {
            foodCaloriesTextField.text = String(format: "%0.f", calories)
        }
        if let imageData = newFood?.imageData {
            selectedImage = UIImage(data: imageData)
        }
    }
    
    private func dismiss() {
        dismiss(animated: true, completion: nil)
    }
    
    private func showPhotoLibrary() {
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        present(self.imagePicker, animated: true, completion: nil)
    }
    
    private func showInputFeedback() {
        if selectedImage == nil {
            imageContainerView.shake()
        }
        if foodNameTextField.text == "" {
            foodNameTextField.shake()
        }
        if foodCaloriesTextField.text == "" {
            foodCaloriesTextField.shake()
        }
    }
}

// Image Picker Delegate
extension NewFoodViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage = pickedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

// Textfield Delegate
extension NewFoodViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        tapGestureRecognizer.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == foodNameTextField {
            textField.resignFirstResponder()
            foodCaloriesTextField.becomeFirstResponder()
        }
        return true
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.text = ""
        return true
    }
    
    private func dismissKeyboard() {
        view.endEditing(true)
    }
}
