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
        $0.addSubview(textField)
        return $0
    }(UIView())
    
    private lazy var textField: UITextField = {
        $0.frame = CGRect(
            x: 60,
            y: view.frame.height - 100,
            width: view.frame.width - 120,
            height: 50
        )
        $0.backgroundColor = .white
        $0.placeholder = "Add any text"
        $0.padding(size: 16)
        $0.layer.cornerRadius = 10
        return $0
    }(UITextField())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
    }


}
