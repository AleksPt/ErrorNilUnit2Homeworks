import UIKit

extension UIButton {
    func setupButton(text: String) {
        self.layer.cornerRadius = 20
        self.setTitle(text, for: .normal)
        self.backgroundColor = ConstantsColor.buttonColor
        self.setTitleColor(ConstantsColor.descriptionColor, for: .normal)
    }
}
