import UIKit

extension UIButton {
    func settingButton(
        title: String,
        titleColor: UIColor = .white,
        fontSize: CGFloat = 20,
        fontName: String = "GillSans-SemiBold",
        backgroundColor: UIColor = mainColor
    ) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = .init(name: fontName, size: fontSize)
        self.layer.cornerRadius = 25
        self.backgroundColor = backgroundColor
    }
}
