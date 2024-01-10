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
    private var myFirstName: String? = "Алексей"
    private var myLastName: String? = "Петренко"
    private var myNumberOfGroup: String? = "6"
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstNameLabel.text = ""
        lastNameLabel.text = ""
        numberOfGroupLabel.text = ""
        
        saveButton.isEnabled = false
        //        saveButton.layer.borderWidth
    }
    
    // MARK: - IB Actions
    @IBAction func didTapFirstName() {
        firstNameLabel.text = myFirstName
    }
    
    @IBAction func didTapSecondName() {
        lastNameLabel.text = myLastName
    }
    
    @IBAction func didTapNumberOfGroup() {
        numberOfGroupLabel.text = myNumberOfGroup
    }
    
    @IBAction func inputFirstName(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    @IBAction func inputLastName(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    @IBAction func inputNumberOfGroup(_ sender: UITextField) {
        saveButton.isEnabled = true
    }
    
    @IBAction func didTapSave(_ sender: UIButton) {
        if firstNameTextField.hasText {
            myFirstName = firstNameTextField.text
            firstNameLabel.text = myFirstName
        }
        
        if lastNameTextField.hasText {
            myLastName = lastNameTextField.text
            lastNameLabel.text = myLastName
        }
        
        if numberOfGroupTextField.hasText {
            myNumberOfGroup = numberOfGroupTextField.text
            numberOfGroupLabel.text = myNumberOfGroup
        }
        
        clearTextFields()
        saveButton.isEnabled = false
    }
    
    @IBAction func pressedReset() {
        myFirstName = "Алексей"
        myLastName = "Петренко"
        myNumberOfGroup = "6"
        
        firstNameLabel.text = myFirstName
        lastNameLabel.text = myLastName
        numberOfGroupLabel.text = myNumberOfGroup
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
    override func touchesBegan(
        _ touches: Set<UITouch>,
        with event: UIEvent?
    ) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
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
