import UIKit

extension UIImageView {
    func setupImagePreview() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
