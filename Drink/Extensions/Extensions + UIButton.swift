import UIKit

extension UIButton {
    func setupButton(text: String) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 20
        self.setTitle(text, for: .normal)
        self.backgroundColor = ConstantsColor.buttonColor
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 16)
    }
}
