import UIKit

final class AuthViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Войдите в аккаунт"
        $0.font = .init(name: "GillSans-SemiBold", size: 30)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var emailTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Ваш email"
        $0.borderStyle = .roundedRect
        return $0
    }(UITextField())
    
    private lazy var passwordTextField: UITextField = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "Ваш пароль"
        $0.borderStyle = .roundedRect
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())
    
    private lazy var forgotPasswordButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Забыли пароль?", for: .normal)
        $0.setTitleColor(mainColor, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 14)
        return $0
    }(UIButton())
    
    private lazy var loginButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Войти", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .init(name: "GillSans-SemiBold", size: 20)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = mainColor
        return $0
    }(UIButton())
    
    private lazy var dontHaveAccLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 14)
        $0.textAlignment = .center
        $0.numberOfLines = 0
        $0.text = "У вас нет аккаунта?"
        return $0
    }(UILabel())
    
    private lazy var signinButton: UIButton = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Зарегистрироваться", for: .normal)
        $0.setTitleColor(.black, for: .normal)
        $0.layer.cornerRadius = 25
        $0.layer.borderWidth = 1
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(dontHaveAccLabel)
        view.addSubview(signinButton)
        setConstraints()
    }
 
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 100),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),

            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 24),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            dontHaveAccLabel.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            dontHaveAccLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            signinButton.topAnchor.constraint(equalTo: dontHaveAccLabel.bottomAnchor, constant: 20),
            signinButton.leadingAnchor.constraint(equalTo: loginButton.leadingAnchor),
            signinButton.trailingAnchor.constraint(equalTo: loginButton.trailingAnchor),
            signinButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}
