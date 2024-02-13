import UIKit
import WebKit

final class WebView: UIViewController {
    
    var urlToShop: String?
    
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
        
        if let urlToShop = urlToShop, let url = URL(string: urlToShop) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }    
}
