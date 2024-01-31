import UIKit

extension UILabel {
    func settingLabel() {
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
