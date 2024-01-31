import UIKit

class ForgotPassViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var titleLabel: UILabel = {
        $0.settingLabel()
        $0.text = "Не помню пароль"
        $0.font = .init(name: "GillSans-SemiBold", size: 30)
        return $0
    }(UILabel())
    
    private lazy var circleView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = mainColor
        $0.layer.cornerRadius = 75
        return $0
    }(UIView())
    
    private lazy var icon: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.image = .lock
        return $0
    }(UIImageView())
    
    private lazy var descriptionLabel: UILabel = {
        $0.settingLabel()
        $0.text = "Введите свой адрес электронной почты, чтобы получить инструкции по восстановлению пароля"
        $0.font = .systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    private lazy var emailTextField: UITextField = {
        $0.settingTextField(placeholder: "Ваш email")
        return $0
    }(UITextField())
    
    private lazy var sendPasswordButton: UIButton = {
        $0.settingButton(title: "Отправить пароль")
        return $0
    }(UIButton())
    
    private lazy var rememberPassButton: UIButton = {
        $0.settingButton(
            title: "Я вспомнил(а) пароль",
            titleColor: mainColor,
            fontSize: 14,
            fontName: "GillSans",
            backgroundColor: .white
        )
        return $0
    }(UIButton(primaryAction: rememberPassAction))
    
    private lazy var rememberPassAction = UIAction { _ in
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
extension ForgotPassViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            circleView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 113),
            circleView.widthAnchor.constraint(equalToConstant: 150),
            circleView.heightAnchor.constraint(equalToConstant: 150),
            
            icon.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 44),
            icon.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: 44),
            icon.widthAnchor.constraint(equalToConstant: 60),
            icon.heightAnchor.constraint(equalToConstant: 60),
            
            descriptionLabel.topAnchor.constraint(equalTo: circleView.bottomAnchor, constant: 44),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            emailTextField.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 38),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 48),
            
            sendPasswordButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
            sendPasswordButton.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor),
            sendPasswordButton.trailingAnchor.constraint(equalTo: emailTextField.trailingAnchor),
            sendPasswordButton.heightAnchor.constraint(equalToConstant: 50),
            
            rememberPassButton.topAnchor.constraint(equalTo: sendPasswordButton.bottomAnchor, constant: 80),
            rememberPassButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
    }
    
    private func setAllSubview() {
        view.addSubview(titleLabel)
        view.addSubview(circleView)
        view.addSubview(icon)
        view.addSubview(descriptionLabel)
        view.addSubview(emailTextField)
        view.addSubview(sendPasswordButton)
        view.addSubview(rememberPassButton)
    }
}
