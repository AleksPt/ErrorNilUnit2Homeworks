import UIKit

class ViewController: UIViewController {
    
    var name = "Имя Фамилия"
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(avatar)
        view.addSubview(nameLabel)
    }
}

