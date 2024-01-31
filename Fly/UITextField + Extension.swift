import UIKit

extension UITextField {
    func settingTextField(
        padding: CGFloat = 20,
        placeholder: String,
        radius: CGFloat = 16,
        borderWidth: CGFloat = 1
    ) {
        self.padding(size: padding)
        self.placeholder = placeholder
        self.layer.cornerRadius = radius
        self.layer.borderWidth = borderWidth
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func padding(size: CGFloat) {
        self.leftView = UIView(
            frame: CGRect(
                x: self.frame.minX,
                y: self.frame.minY,
                width: size,
                height: self.frame.height
            )
        )
        self.leftViewMode = .always
    }
}
