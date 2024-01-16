import UIKit

final class SettingsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}
