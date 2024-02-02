import UIKit

final class ViewController: UIViewController {

    lazy var tl: UILabel = {
        $0.text = "Негрони"
        $0.textAlignment = .center
        $0.frame = CGRect(x: view.frame.width / 2 - 100, y: view.frame.midY - 25, width: 200, height: 50)
        $0.font = .init(name: ConstantsFont.titleFont, size: 50)
        $0.textColor = ConstantsColor.titleColor
        return $0
    }(UILabel())
    
    lazy var btn: UIButton = {
        $0.frame = CGRect(x: 100, y: 200, width: 200, height: 50)
        $0.setTitle("Подробнее", for: .normal)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = ConstantsColor.buttonColor
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 16)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(
            red: 254 / 255,
            green: 250 / 255,
            blue: 236 / 255,
            alpha: 1
        )
        view.addSubview(tl)
        view.addSubview(btn)
    }


}

// 254,250,236
