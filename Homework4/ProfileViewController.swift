import UIKit

protocol ViewControllerDelegate {
    func setLabelText(firstName: String, secondName: String)
}

final class ProfileViewController: UIViewController {
    
    lazy var vStack = {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 11
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(avatar)
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(settingsButton)
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: view.frame.minX,
                y: view.frame.height - view.frame.height + 200,
                width: view.frame.width,
                height: view.frame.height - 625 - 142
            )
        )
    )
    
    lazy var hStackCustomViews = {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.spacing = 22
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(setViews())
        $0.addArrangedSubview(setViews())
        $0.addArrangedSubview(setViews())
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: view.frame.minX + 30,
                y: vStack.frame.maxY + 32,
                width: view.frame.width - 60,
                height: 79
            )
        )
    )
    
    lazy var vStackFriendsLabels = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(setCountLabels(count: 10))
        $0.addArrangedSubview(setTextLabels(text: "Друзей"))
        $0.addArrangedSubview(UIView())
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: view.frame.minX + 45,
                y: hStackCustomViews.frame.minY,
                width: 94,
                height: hStackCustomViews.bounds.maxY
            )
        )
    )
    
    lazy var vStackSubscribesLabels = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(setCountLabels(count: 20))
        $0.addArrangedSubview(setTextLabels(text: "Подписок"))
        $0.addArrangedSubview(UIView())
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: view.frame.minX + 180,
                y: hStackCustomViews.frame.minY,
                width: 94,
                height: hStackCustomViews.bounds.maxY
            )
        )
    )
    
    lazy var vStackFavouritesLabels = {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.addArrangedSubview(UIView())
        $0.addArrangedSubview(setCountLabels(count: 30))
        $0.addArrangedSubview(setTextLabels(text: "Избранных"))
        $0.addArrangedSubview(UIView())
        return $0
    }(
        UIStackView(
            frame: CGRect(
                x: view.frame.minX + 306,
                y: hStackCustomViews.frame.minY,
                width: 94,
                height: hStackCustomViews.bounds.maxY
            )
        )
    )
    
    lazy var avatar = {
        $0.image = UIImage(named: "avatar")
        return $0
    }(UIImageView())
    
    lazy var nameLabel = {
        $0.text = "Iron Man"
        $0.font = .boldSystemFont(ofSize: 20)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    lazy var settingsButton = {
        $0.setTitleColor(.systemBlue, for: .normal)
        $0.setTitle("Настройки", for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 16)
        return $0
    }(UIButton(primaryAction: settingsButtonAction))
    
    lazy var settingsButtonAction = UIAction { _ in
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }
    
    lazy var imageView = {
        $0.image = UIImage(named: "iAmIronman")
        $0.frame = CGRect(
            x: view.frame.minX + 31,
            y: hStackCustomViews.frame.maxY + 42,
            width: 369,
            height: 300
        )
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    lazy var moreInfoButton = {
        $0.setTitle("More info", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.backgroundColor = .red
        $0.layer.cornerRadius = 20
        $0.frame = CGRect(
        x: imageView.frame.minX,
        y: imageView.frame.maxY + 25,
        width: imageView.bounds.maxX,
        height: 60
        )
        return $0
    }(UIButton(primaryAction: moreInfoAction))
    
    lazy var moreInfoAction = UIAction { _ in
        let vc = InfoViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubview()
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
        return view
    }
    
    private func setCountLabels(count: Int) -> UILabel {
        let label = UILabel()
        label.text = String(count)
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }
    
    private func setTextLabels(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16)
        label.sizeToFit()
        return label
    }
    
    private func addSubview() {
        view.addSubview(imageView)
        view.addSubview(vStack)
        view.addSubview(hStackCustomViews)
        view.addSubview(vStackFriendsLabels)
        view.addSubview(vStackSubscribesLabels)
        view.addSubview(vStackFavouritesLabels)
        view.addSubview(moreInfoButton)
    }
}
