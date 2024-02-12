import UIKit

final class MainViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        $0.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        )
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())
    
    private lazy var scrollViewContent: UIView = {
        $0.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        )
        $0.backgroundColor = .red
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
    }


}

