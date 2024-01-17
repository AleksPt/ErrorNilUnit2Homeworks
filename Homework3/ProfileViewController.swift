import UIKit

protocol ViewControllerDelegate {
    func setLabelText(firstName: String, secondName: String)
}

final class ViewController: UIViewController {
    
    lazy var avatar = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.frame = CGRect(
            x: view.center.x - 50,
            y: view.frame.height - view.frame.height + 200,
            width: 100,
            height: 100
        )
        return avatar
    }()
    
    lazy var nameLabel = {
        let label = UILabel()
        label.text = "Iron Man"
        label.font = .boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.frame = CGRect(
            x: 0,
            y: avatar.frame.maxY + 14,
            width: view.frame.width,
            height: 24
        )
        return label
    }()
    
    lazy var settingsButton = {
        let button = UIButton(primaryAction: settingsButtonAction)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitle("Настройки", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.frame.origin.y = nameLabel.frame.maxY + 8
        button.frame = CGRect(
            x: view.frame.midX - 43,
            y: nameLabel.frame.maxY + 8,
            width: 86,
            height: 19
        )
        return button
    }()
    
    lazy var settingsButtonAction = UIAction { _ in
        let settingsViewController = SettingsViewController()
        settingsViewController.delegate = self
        self.navigationController?.pushViewController(settingsViewController, animated: true)
    }

    lazy var imageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iAmIronman")
        image.frame = CGRect(
            x: view.frame.minX + 31,
            y: avatar.frame.maxY + 218,
            width: 369,
            height: 300
        )
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubview()
    }
}

// MARK: - Extensions
extension ViewController: ViewControllerDelegate {
    func setLabelText(firstName: String, secondName: String) {
        self.nameLabel.text = firstName + " " + secondName
    }
}

extension ViewController {
    private func setViews(offsetX: CGFloat) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        view.layer.cornerRadius = 10
        view.frame = CGRect(
            x: view.frame.minX + offsetX,
            y: settingsButton.frame.maxY + 32,
            width: 109,
            height: 79
        )
        return view
    }
    
    private func setCountLabels(count: Int, offsetX: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = String(count)
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: view.frame.minX + offsetX,
            y: avatar.frame.maxY + 115
        )
        return label
    }
    
    private func setTextLabels(text: String, offsetX: CGFloat) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: view.frame.minX + offsetX,
            y: avatar.frame.maxY + 136
        )
        return label
    }
    
    private func addSubview() {
        view.addSubview(avatar)
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        view.addSubview(imageView)
        view.addSubview(setViews(offsetX: 30))
        view.addSubview(setViews(offsetX: 160))
        view.addSubview(setViews(offsetX: 291))
        view.addSubview(setCountLabels(count: 10, offsetX: 45))
        view.addSubview(setCountLabels(count: 20, offsetX: 180))
        view.addSubview(setCountLabels(count: 30, offsetX: 306))
        view.addSubview(setTextLabels(text: "Друзей", offsetX: 45))
        view.addSubview(setTextLabels(text: "Подписок", offsetX: 180))
        view.addSubview(setTextLabels(text: "Избранных", offsetX: 306))
    }
}
