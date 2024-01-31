import UIKit

final class AuthViewController: UIViewController {

    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Войдите в аккаунт"
        
        return $0
    }(UILabel())
    
    private lazy var emailTextField: UITextField = {
        return $0
    }(UITextField())
    
    private lazy var passwordTextField: UITextField = {
        return $0
    }(UITextField())
    
    private lazy var forgotPasswordLabel: UILabel = {
        return $0
    }(UILabel())
    
    private lazy var loginButton: UIButton = {
        return $0
    }(UIButton())
    
    private lazy var dontHaveAccLabel: UILabel = {
        return $0
    }(UILabel())
    
    private lazy var signinButton: UIButton = {
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setConstraints()
    }
 
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
}
