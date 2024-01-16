import UIKit

class ViewController: UIViewController {
    
    var name = "Iron Man"
    let countFriends = 10
    let countSubscribes = 20
    let countFavourites = 30
    
    // MARK: - Avatar
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
    
    // MARK: - First name and Second Name
    lazy var nameLabel = {
        let label = UILabel()
        label.text = name
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
    
    // MARK: - Settings Button
    lazy var settingsButton = {
        let button = UIButton()
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
    
    // MARK: - View
    lazy var rectangleLeftView = {
        let rect = UIView()
        rect.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        rect.layer.cornerRadius = 10
        rect.frame = CGRect(
            x: view.frame.minX + 30,
            y: settingsButton.frame.maxY + 32,
            width: 109,
            height: 79
        )
        return rect
    }()
    
    lazy var rectangleCenterView = {
        let rect = UIView()
        rect.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        rect.layer.cornerRadius = 10
        rect.frame = CGRect(
            x: view.frame.midX - 54.5,
            y: settingsButton.frame.maxY + 32,
            width: 109,
            height: 79
        )
        return rect
    }()
    
    lazy var rectangleRightView = {
        let rect = UIView()
        rect.backgroundColor = UIColor(
            red: 242/255,
            green: 242/255,
            blue: 242/255,
            alpha: 1
        )
        rect.layer.cornerRadius = 10
        rect.frame = CGRect(
            x: view.frame.maxX - 139,
            y: settingsButton.frame.maxY + 32,
            width: 109,
            height: 79
        )
        return rect
    }()
    
    // MARK: - Number Labels in Views
    lazy var countFriendsLabel = {
        let label = UILabel()
        label.text = String(countFriends)
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleLeftView.frame.minX + 15,
            y: rectangleLeftView.frame.minY + 18
        )
        return label
    }()
    
    lazy var countSubscribesLabel = {
       let label = UILabel()
        label.text = String(countSubscribes)
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleCenterView.frame.minX + 15,
            y: rectangleCenterView.frame.minY + 18
        )
        return label
    }()
    
    lazy var countFavouritesLabel = {
       let label = UILabel()
        label.text = String(countFavourites)
        label.font = .boldSystemFont(ofSize: 20)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleRightView.frame.minX + 15,
            y: rectangleRightView.frame.minY + 18
        )
        return label
    }()
    
    // MARK: - Text labels in Views
    lazy var textFriendsLabel = {
        let label = UILabel()
        label.text = "Друзей"
        label.font = .systemFont(ofSize: 16)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleLeftView.frame.minX + 15,
            y: countFriendsLabel.frame.maxY
        )
        return label
    }()
    
    lazy var textSubscribesLabel = {
        let label = UILabel()
        label.text = "Подписок"
        label.font = .systemFont(ofSize: 16)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleCenterView.frame.minX + 15,
            y: countSubscribesLabel.frame.maxY
        )
        return label
    }()
    
    lazy var textFavouritesLabel = {
        let label = UILabel()
        label.text = "Избранных"
        label.font = .systemFont(ofSize: 16)
        label.sizeToFit()
        label.frame.origin = CGPoint(
            x: rectangleRightView.frame.minX + 15,
            y: countFavouritesLabel.frame.maxY
        )
        return label
    }()
    
    // MARK: - ImageView
    lazy var imageView = {
        let image = UIImageView()
        image.image = UIImage(named: "iAmIronman")
        image.frame = CGRect(
            x: view.frame.minX + 31,
            y: rectangleCenterView.frame.maxY + 42,
            width: rectangleRightView.frame.maxX - 30,
            height: 250
        )
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(avatar)
        view.addSubview(nameLabel)
        view.addSubview(settingsButton)
        view.addSubview(rectangleLeftView)
        view.addSubview(rectangleCenterView)
        view.addSubview(rectangleRightView)
        view.addSubview(countFriendsLabel)
        view.addSubview(countSubscribesLabel)
        view.addSubview(countFavouritesLabel)
        view.addSubview(textFriendsLabel)
        view.addSubview(textSubscribesLabel)
        view.addSubview(textFavouritesLabel)
        view.addSubview(imageView)

    }
}

