import UIKit

final class MainViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        $0.contentSize = scrollViewContent.frame.size
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
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tapFunc)
        )
        $0.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        )
        $0.backgroundColor = .white
        $0.addSubview(textField)
        $0.addGestureRecognizer(tapGesture)
        return $0
    }(UIView())
    
    private lazy var textField: UITextField = {
        $0.frame = CGRect(
            x: 60,
            y: view.frame.maxY - 250,
            width: view.frame.width - 120,
            height: 40
        )
        $0.layer.borderWidth = 0.7
        $0.backgroundColor = .white
        $0.placeholder = "Add any text"
        $0.padding(size: 16)
        $0.layer.cornerRadius = 5
        return $0
    }(UITextField())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(showKeyboard),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(hideKeyboard),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc private func tapFunc() {
        scrollView.endEditing(true)
    }
    
    @objc private func showKeyboard(sender: Notification) {
        if let rect = sender.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            scrollView.frame.origin.y -= rect.height
        }
    }
    
    @objc private func hideKeyboard(sender: Notification) {
        if let rect = sender.userInfo?["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            scrollView.frame.origin.y += rect.height
        }
    }
}