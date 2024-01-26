import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - Public Properties
    var delegate: ProfileViewController?
    
    // MARK: - Private Properties
    private let numbers: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"]
    private var isContainsNumbers = false
    
    private lazy var descriptionLabel = {
        $0.text = "Введите новые данные"
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var customView = {
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var vStack = {
        $0.axis = .vertical
        $0.spacing = 11
        $0.distribution = .fillEqually
        $0.addArrangedSubview(firstNameTextField)
        $0.addArrangedSubview(secondNameTextField)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    private lazy var firstNameTextField = {
        $0.backgroundColor = .white
        $0.placeholder = "Имя"
        $0.padding(size: 31)
        $0.layer.cornerRadius = 30
        return $0
    }(UITextField())
    
    private lazy var secondNameTextField = {
        $0.backgroundColor = .white
        $0.placeholder = "Фамилия"
        $0.layer.cornerRadius = 30
        $0.padding(size: 31)
        return $0
    }(UITextField())
    
    private lazy var saveButton = {
        $0.setTitle("Сохранить", for: .normal)
        $0.backgroundColor = .black
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 30
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: saveAction))
    
    private lazy var saveAction = UIAction { _ in
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
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(descriptionLabel)
        view.addSubview(customView)
        view.addSubview(vStack)
        view.addSubview(saveButton)
        
        setConstraints()
    }
    
    // MARK: - Public Methods
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
    private func showAlert() {
        let alert = UIAlertController(
            title: "👹",
            message: "Не используйте цифры",
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .cancel
        )
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 186),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            
            customView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 36),
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -31),
            customView.heightAnchor.constraint(equalToConstant: 264),
            
            vStack.topAnchor.constraint(equalTo: customView.topAnchor, constant: 32),
            vStack.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15),
            vStack.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -15),
            vStack.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -113),
            
            saveButton.topAnchor.constraint(equalTo: vStack.bottomAnchor, constant: 28),
            saveButton.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 15),
            saveButton.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -15),
            saveButton.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
}

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
