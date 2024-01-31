import UIKit

final class AuthViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var titleLabel: UILabel = {
        $0.settingTitleLabel(text: "Войдите в аккаунт")
        return $0
    }(UILabel())
    
    private lazy var emailTextField: UITextField = {
        $0.settingTextField(placeholder: "Ваш email")
        return $0
    }(UITextField())
    
    private lazy var passwordTextField: UITextField = {
        $0.settingTextField(placeholder: "Ваш пароль")
        $0.isSecureTextEntry = true
        return $0
    }(UITextField())
    
    private lazy var forgotPasswordButton: UIButton = {
        $0.settingButton(
            title: "Забыли пароль?",
            titleColor: mainColor,
            fontSize: 14,
            fontName: "GillSans",
            backgroundColor: .white
        )
        return $0
    }(UIButton(primaryAction: forgotPassAction))
    
    private lazy var forgotPassAction = UIAction { _ in
        let vc = ForgotPassViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
    
    private lazy var loginButton: UIButton = {
        $0.settingButton(title: "Войти")
        return $0
    }(UIButton())
    
    private lazy var dontHaveAccLabel: UILabel = {
        $0.settingLabel()
        $0.font = .systemFont(ofSize: 14)
        $0.text = "У вас нет аккаунта?"
        return $0
    }(UILabel())
    
    private lazy var signinButton: UIButton = {
        $0.settingButton(
            title: "Зарегистрироваться",
            titleColor: .black,
            fontName: "GillSans",
            backgroundColor: .systemBackground
        )
        $0.layer.borderWidth = 1
        return $0
    }(UIButton(primaryAction: signinAction))
    
    private lazy var signinAction = UIAction { _ in
        let vc = CreateAccViewController()
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

// MARK: - Extensions
extension AuthViewController {
    private func setAllSubview() {
        view.addSubview(titleLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(dontHaveAccLabel)
        view.addSubview(signinButton)
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
