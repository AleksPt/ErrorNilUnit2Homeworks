import UIKit

class ViewController: UIViewController {
    
    lazy var avatar = {
        let avatar = UIImageView()
        avatar.image = UIImage(named: "avatar")
        avatar.frame = CGRect(
            x: view.center.x - 50,
            y: view.frame.height - view.frame.size.height + 200,
            width: 100,
            height: 100
        )
        return avatar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(avatar)
    }
}

