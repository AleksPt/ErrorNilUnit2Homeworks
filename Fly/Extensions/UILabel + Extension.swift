import UIKit

extension UILabel {
    func settingLabel() {
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func settingTitleLabel(size: CGFloat = 30, text: String) {
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
        self.numberOfLines = 0
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = .init(name: "GillSans-SemiBold", size: size)
        self.text = text
    }
}
