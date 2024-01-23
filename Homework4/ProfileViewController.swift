import UIKit

protocol ViewControllerDelegate {
    func setLabelText(firstName: String, secondName: String)
}

final class ProfileViewController: UIViewController {
    
    lazy var avatar: UIImageView = {
        $0.image = UIImage(named: "avatar")
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var nameLabel: UILabel = {
        $0.text = "Iron Man"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    lazy var settingsButton: UIButton = {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitle("Настройки", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: settingsButtonAction))
    
    lazy var settingsButtonAction = UIAction { _ in
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    lazy var leftView: UIView = {
       setViews()
    }()
    
    lazy var centerView: UIView = {
       setViews()
    }()
    
    lazy var rightView: UIView = {
       setViews()
    }()
    
    lazy var vStackFriendsLabels: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(setCountLabels(count: 10))
        $0.addArrangedSubview(setTextLabels(text: "Друзей"))
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    lazy var vStackSubscribesLabels: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(setCountLabels(count: 20))
        $0.addArrangedSubview(setTextLabels(text: "Подписок"))
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    lazy var vStackFavouritesLabels: UIStackView = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(setCountLabels(count: 30))
        $0.addArrangedSubview(setTextLabels(text: "Избранных"))
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIStackView())
    
    lazy var imageView: UIImageView = {
        $0.image = UIImage(named: "iAmIronman")
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    lazy var moreInfoButton: UIButton = {
        $0.setTitle("More info", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 20
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIButton(primaryAction: moreInfoAction))
    
    lazy var moreInfoAction = UIAction { _ in
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubview()
        setConstraints()
    }
}

// MARK: - Extensions
extension ProfileViewController: ViewControllerDelegate {
    func setLabelText(firstName: String, secondName: String) {
        self.nameLabel.text = firstName + " " + secondName
    }
}

extension ProfileViewController {
    private func setViews() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    private func setCountLabels(count: Int) -> UILabel {
        let label = UILabel()
        label.text = String(count)
        label.font = .boldSystemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }
    
    private func setTextLabels(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 14)
        label.sizeToFit()
        return label
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([

            avatar.topAnchor.constraint(equalTo: view.topAnchor, constant: 142),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 14),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            nameLabel.bottomAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 38),
            
            settingsButton.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            settingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            settingsButton.widthAnchor.constraint(equalToConstant: view.frame.width),
            settingsButton.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 27),
                        
            leftView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 32),
            leftView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            leftView.widthAnchor.constraint(equalToConstant: 109),
            leftView.heightAnchor.constraint(equalToConstant: 79),
            
            centerView.topAnchor.constraint(equalTo: leftView.topAnchor),
            centerView.widthAnchor.constraint(equalToConstant: 109),
            centerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            centerView.heightAnchor.constraint(equalToConstant: 79),
            
            rightView.topAnchor.constraint(equalTo: settingsButton.bottomAnchor, constant: 32),
            rightView.widthAnchor.constraint(equalToConstant: 109),
            rightView.heightAnchor.constraint(equalToConstant: 79),
            rightView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            
            vStackFriendsLabels.centerYAnchor.constraint(equalTo: leftView.centerYAnchor),
            vStackFriendsLabels.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 15),
            
            vStackSubscribesLabels.centerYAnchor.constraint(equalTo: centerView.centerYAnchor),
            vStackSubscribesLabels.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 15),
            
            vStackFavouritesLabels.centerYAnchor.constraint(equalTo: rightView.centerYAnchor),
            vStackFavouritesLabels.leadingAnchor.constraint(equalTo: rightView.leadingAnchor, constant: 15),
            
            imageView.topAnchor.constraint(equalTo: leftView.bottomAnchor, constant: 42),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -140),
            imageView.leadingAnchor.constraint(equalTo: leftView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: rightView.trailingAnchor, constant: 0),

            moreInfoButton.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            moreInfoButton.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
            moreInfoButton.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
            moreInfoButton.heightAnchor.constraint(equalToConstant: 70)
            
        ])
    }
    
    private func addSubview() {
        view.addSubview(avatar)
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        view.addSubview(leftView)
        view.addSubview(centerView)
        view.addSubview(rightView)
        view.addSubview(vStackFriendsLabels)
        view.addSubview(vStackSubscribesLabels)
        view.addSubview(vStackFavouritesLabels)
        view.addSubview(imageView)
        view.addSubview(moreInfoButton)
    }
}
