import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var numberOfGroupLabel: UILabel!
    
    @IBOutlet weak var saveButton: UIButton!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var numberOfGroupTextField: UITextField!
    
    // MARK: - Private Properties
    private let myFirstName = "Алексей"
    private let myLastName = "Петренко"
    private let myNumberOfGroup = "6"
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = ""
        lastNameLabel.text = ""
        numberOfGroupLabel.text = ""
        
        saveButton.isEnabled = false
    }
    
    // MARK: - IB Actions
    @IBAction func didTapFirstname() {
        firstNameLabel.text = myFirstName
        clearTextFields()
    }
    
    @IBAction func didTapSecondName() {
        lastNameLabel.text = myLastName
        clearTextFields()
    }
    
    @IBAction func didTapNumberOfGroup() {
        numberOfGroupLabel.text = myNumberOfGroup
        clearTextFields()
    }
    
    @IBAction func setFirstName(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    
    @IBAction func setLastName(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    
    @IBAction func setNumberOfGroup(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    
    @IBAction func didTapSave(_ sender: UIButton) {
        firstNameLabel.text = firstNameTextField.text
        lastNameLabel.text = lastNameTextField.text
        numberOfGroupLabel.text = numberOfGroupTextField.text
        
        clearTextFields()
        
        saveButton.isEnabled = false
    }
    
    // MARK: - Private Methods
    private func clearTextFields() {
        firstNameTextField.text = nil
        lastNameTextField.text = nil
        numberOfGroupTextField.text = nil
    }
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == firstNameTextField {
            lastNameTextField.becomeFirstResponder()
        } else if textField == lastNameTextField {
            numberOfGroupTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        
        return true
    }
}
