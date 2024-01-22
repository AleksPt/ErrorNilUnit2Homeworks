import UIKit

final class SettingsViewController: UIViewController {
    
    let numbers: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    var isContainsNumbers = false
    
    var delegate: ProfileViewController?
    
    lazy var descriptionLabel = {
        $0.text = "Введите новые данные"
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 16)
        $0.frame.origin = CGPoint(
            x: view.frame.minX + 31,
            y: view.frame.minY + 186
        )
        return $0
    }(UILabel())
    
    lazy var customView = {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        $0.frame = CGRect(
            x: view.frame.minX + 31,
            y: descriptionLabel.frame.maxY + 36,
            width: view.frame.maxX - 60,
            height: 264
        )
        return $0
    }(UIView())
    
    lazy var vStack = {
        $0.axis = .vertical
        $0.spacing = 11
        $0.distribution = .fillEqually
        $0.addArrangedSubview(firstNameTextField)
        $0.addArrangedSubview(secondNameTextField)
        return $0
    }(UIStackView())
    
    lazy var vMainStack = {
        $0.axis = .vertical
        $0.spacing = 28
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(vStack)
        $0.addArrangedSubview(saveButton)
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: customView.frame.minX + 15,
                y: customView.frame.minY + 32,
                width: customView.frame.width - 30,
                height: customView.frame.height - 63
            )
        )
    )
    
    lazy var firstNameTextField = {
        $0.backgroundColor = .white
        $0.placeholder = "Имя"
        $0.padding(size: 31)
        $0.layer.cornerRadius = 30
        return $0
    }(UITextField())
    
    lazy var secondNameTextField = {
        $0.backgroundColor = .white
        $0.placeholder = "Фамилия"
        $0.layer.cornerRadius = 30
        $0.padding(size: 31)
        return $0
    }(UITextField())
    
    lazy var saveButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 30
        return $0
    }(UIButton(primaryAction: saveAction))
    
    lazy var saveAction = UIAction { _ in
        if self.firstNameTextField.hasText || self.secondNameTextField.hasText {
            self.isContainsNumbers = false
            self.checkNumberInTextField()
            guard !self.isContainsNumbers else { return }
            self.delegate?.setLabelText(
                firstName: self.firstNameTextField.text ?? "",
                secondName: self.secondNameTextField.text ?? ""
            )
            self.view.endEditing(true)
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(customView)
        view.addSubview(descriptionLabel)
        view.addSubview(vMainStack)
    }
    
    private func checkNumberInTextField() {
        guard let firstName = self.firstNameTextField.text else { return }
        guard let secondName = self.secondNameTextField.text else { return }
        for character in firstName {
            if self.numbers.contains(character) {
                isContainsNumbers = true
                showAlert()
                self.firstNameTextField.text = .none
                self.secondNameTextField.text = .none
            }
        }
        for character in secondName {
            if self.numbers.contains(character) {
                isContainsNumbers = true
                showAlert()
                self.firstNameTextField.text = .none
                self.secondNameTextField.text = .none
            }
        }
    }
}

// MARK: - Extensions
extension UITextField {
    func padding(size: CGFloat) {
        self.leftView = UIView(
            frame: CGRect(
                x: self.frame.minX,
                y: self.frame.minY,
                width: size,
                height: self.frame.height
            )
        )
        self.leftViewMode = .always
    }
}

extension SettingsViewController {
    func showAlert() {
        let alert = UIAlertController(
            title: "👹",
            message: "Не используйте цифры",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Извините",
            style: .cancel
        )
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
