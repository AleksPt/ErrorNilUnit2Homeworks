import UIKit

final class CreateAccViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var titleLabel: UILabel = {
        $0.settingTitleLabel(text: "Создать аккаунт")
        return $0
    }(UILabel())
    
    private lazy var usernameTextField: UITextField = {
        $0.settingTextField(placeholder: "Username")
        return $0
    }(UITextField())
    
    private lazy var emailTextField: UITextField = {
        $0.settingTextField(placeholder: "Your Email")
        return $0
    }(UITextField())
    
    private lazy var passwordTextField: UITextField = {
        $0.settingTextField(placeholder: "Password")
        return $0
    }(UITextField())
    
    private lazy var confirmPassTextField: UITextField = {
        $0.settingTextField(placeholder: "Confirm Password")
        return $0
    }(UITextField())
    
    private lazy var signupButton: UIButton = {
        $0.settingButton(title: "Зарегистрироваться")
        return $0
    }(UIButton())
    
    private lazy var loginButton: UIButton = {
        $0.settingButton(
            title: "У вас уже есть аккаунт? Войти",
            titleColor: mainColor,
            fontSize: 14,
            fontName: "GillSans",
            backgroundColor: .white
        )
        return $0
    }(UIButton(primaryAction: loginAction))
    
    private lazy var loginAction = UIAction { _ in
        let vc = AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllSubview()
        setConstraints()
    }
}

// MARK: - Extension
extension CreateAccViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            usernameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            usernameTextField.heightAnchor.constraint(equalToConstant: 48),
            
            emailTextField.topAnchor.constraint(equalTo: usernameTextField.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            passwordTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 48),
            
            confirmPassTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20),
            confirmPassTextField.leadingAnchor.constraint(equalTo: usernameTextField.leadingAnchor),
            confirmPassTextField.trailingAnchor.constraint(equalTo: usernameTextField.trailingAnchor),
            confirmPassTextField.heightAnchor.constraint(equalToConstant: 48),

            signupButton.topAnchor.constraint(equalTo: confirmPassTextField.bottomAnchor, constant: 20),
            signupButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            signupButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            signupButton.heightAnchor.constraint(equalToConstant: 48),
            
            loginButton.topAnchor.constraint(equalTo: signupButton.bottomAnchor, constant: 90),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setAllSubview() {
        view.addSubview(titleLabel)
        view.addSubview(usernameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmPassTextField)
        view.addSubview(signupButton)
        view.addSubview(loginButton)
    }
}
