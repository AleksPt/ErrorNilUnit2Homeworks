import UIKit
import WebKit

final class WebView: UIViewController {

    private lazy var webView: WKWebView = {
        $0.frame = CGRect(
            x: 0,
            y: 0,
            width: view.frame.width,
            height: view.frame.height
        )
        return $0
    }(WKWebView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(webView)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(goToShop),
            name: .goToShop,
            object: nil
        )
    }
    
    @objc private func goToShop() {
        if let url = URL(string: "https://poizon.shoes/nike") {
            let req = URLRequest(url: url)
            webView.load(req)
        }
    }
    
//    @objc private func goToShop(sender: Notification) {
//        guard let url = sender.userInfo?["url"] as? String else { return }
//        guard let url = URL(string: url) else { return }
//        let request = URLRequest(url: url)
//        webView.load(request)
//    }
    
}
