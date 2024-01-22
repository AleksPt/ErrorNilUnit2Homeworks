import UIKit

final class ViewController: UIViewController {
    
    lazy var authLabel = {
        let label = UILabel()
        label.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: view.frame.size.height - view.frame.size.height + 222,
            width: view.frame.size.width - 66,
            height: 36
        )
        label.text = "Авторизация"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 30)
        return label
    }()
    
    lazy var descriptionLabel = {
        let label = UILabel()
        label.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: view.frame.size.height - view.frame.size.height + 274,
            width: view.frame.size.width - 66,
            height: 50
        )
        label.text = "Lorem ipsum dolor sit amet, consectetur adipisi ing elit, sed do eiusmod"
        label.textColor = .white
        label.font = label.font.withSize(16)
        label.numberOfLines = 0
        return label
    }()
    
    lazy var emailTextField = {
        let emailTF = UITextField()
        emailTF.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: passwordTextField.frame.minY - passwordTextField.frame.size.height - 21,
            width: view.frame.size.width - 66,
            height: 50
        )
        emailTF.backgroundColor = .white
        emailTF.layer.cornerRadius = 25
        emailTF.placeholder = "Email"
        emailTF.padding(size: 23)
        return emailTF
    }()
    
    lazy var passwordTextField = {
        let emailTF = UITextField()
        emailTF.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: view.frame.midY,
            width: view.frame.size.width - 66,
            height: 50
        )
        emailTF.backgroundColor = .white
        emailTF.layer.cornerRadius = 25
        emailTF.placeholder = "Пароль"
        emailTF.padding(size: 23)
        return emailTF
    }()

    lazy var enterButton = {
        let button = UIButton(primaryAction: enterAction)
        button.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: passwordTextField.frame.maxY + 45,
            width: view.frame.size.width - 66,
            height: 50
        )
        button.backgroundColor = .white
        button.layer.cornerRadius = 23
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitleColor(UIColor(
            red: 8/255,
            green: 83/255,
            blue: 138/255,
            alpha: 1
        ), for: .normal)
        return button
    }()
    
    lazy var registrationButton = {
        let button = UIButton(primaryAction: registrationAction)
        button.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: enterButton.frame.maxY + 16,
            width: view.frame.size.width - 66,
            height: 19
        )
        button.setTitle("Регистрация", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    lazy var forgetPasswordButton = {
        let button = UIButton(primaryAction: forgetPasswordAction)
        button.frame = CGRect(
            x: view.frame.size.width - view.frame.size.width + 33,
            y: view.frame.size.height - 100,
            width: view.frame.size.width - 66,
            height: 19
        )
        button.setTitle("Забыли пароль?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }()
    
    lazy var enterAction = UIAction { _ in
        self.showAlert(title: "Hi!", message: "👋")
    }
    
    lazy var registrationAction = UIAction { _ in
        self.showAlert(title: "Welcome!", message: "🤩")
    }
    
    lazy var forgetPasswordAction = UIAction { _ in
        self.showAlert(title: "💩💩💩", message: "")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(
            red: 8/255,
            green: 83/255,
            blue: 138/255,
            alpha: 1
        )
        
        view.addSubview(authLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(enterButton)
        view.addSubview(registrationButton)
        view.addSubview(forgetPasswordButton)
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

extension ViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
}

extension ViewController {
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "OK",
            style: .cancel
        )
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
