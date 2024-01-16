import UIKit



final class SettingsViewController: UIViewController {
    
    var delegate: ViewControllerDelegate?
    
    lazy var descriptionLabel = {
        let label = UILabel()
        label.text = "Введите новые данные"
        label.sizeToFit()
        label.font = .systemFont(ofSize: 16)
        label.frame.origin = CGPoint(
            x: view.frame.minX + 31,
            y: view.frame.minY + 186
        )
        return label
    }()
    
    lazy var customView = {
        let customView = UIView()
        customView.layer.cornerRadius = 20
        customView.clipsToBounds = true
        customView.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        customView.frame = CGRect(
            x: view.frame.minX + 31,
            y: descriptionLabel.frame.maxY + 36,
            width: view.frame.maxX - 60,
            height: 264
        )
        return customView
    }()
    
    lazy var firstNameTextField = {
        let name = UITextField()
        name.backgroundColor = .white
        name.placeholder = "Имя"
        name.frame = CGRect(
            x: customView.frame.minX + 15,
            y: customView.frame.minY + 32,
            width: customView.frame.width - 30,
            height: 54
        )
        name.padding(size: 31)
        name.layer.cornerRadius = 30
        return name
    }()
    lazy var secondNameTextField = {
        let name = UITextField()
        name.backgroundColor = .white
        name.placeholder = "Фамилия"
        name.frame = CGRect(
            x: customView.frame.minX + 15,
            y: firstNameTextField.frame.maxY + 11,
            width: customView.frame.width - 30,
            height: 54
        )
        name.layer.cornerRadius = 30
        name.padding(size: 31)
        return name
    }()
    
    lazy var saveButton = {
        let button = UIButton(primaryAction: saveAction)
        button.setTitle("Сохранить", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 30
        button.frame = CGRect(
            x: customView.frame.minX + 15,
            y: secondNameTextField.frame.maxY + 28,
            width: customView.frame.width - 30,
            height: 54
        )
        return button
    }()
    
    lazy var saveAction = UIAction { _ in
        self.delegate?.setLabelText(
            firstName: self.firstNameTextField.text ?? "",
            secondName: self.secondNameTextField.text ?? ""
        )
        self.view.endEditing(true)
        self.firstNameTextField.text = ""
        self.secondNameTextField.text = ""
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(descriptionLabel)
        view.addSubview(customView)
        view.addSubview(firstNameTextField)
        view.addSubview(secondNameTextField)
        view.addSubview(saveButton)
        
    }
}

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

extension SettingsViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}
