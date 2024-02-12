import UIKit

final class CartViewController: UIViewController {

    private lazy var exitButton: UIButton = {
        $0.setImage(.init(systemName: Image.mainPageImage), for: .normal)
        return $0
    }(UIButton())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Cart"
        navigationItem.rightBarButtonItem = .init(customView: exitButton)
    }
    
}
