import UIKit

extension UIImageView {
    func setupImagePreview() {
        self.layer.cornerRadius = 20
        self.clipsToBounds = true
        self.contentMode = .scaleAspectFill
    }
}
