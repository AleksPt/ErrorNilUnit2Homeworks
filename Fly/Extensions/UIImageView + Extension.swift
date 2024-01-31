import UIKit

extension UIImageView {
    func settingImage() {
        self.layer.cornerRadius = 15
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
}
