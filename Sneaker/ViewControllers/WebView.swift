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
        
        if let url = URL(string: "https://poizon.shoes/nike") {
            let req = URLRequest(url: url)
            webView.load(req)
        }
    }    
}
