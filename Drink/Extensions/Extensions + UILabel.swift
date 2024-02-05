import UIKit

extension UILabel {
    func setupTitleLabel(size: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.font = .init(name: ConstantsFont.titleFont, size: size)
        self.textColor = ConstantsColor.dark
    }
    
    func setupDescriptionLabel(size: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.numberOfLines = 0
        self.font = .init(name: ConstantsFont.descriptionFont, size: size)
        self.textColor = ConstantsColor.dark
        self.sizeToFit()
    }
}
