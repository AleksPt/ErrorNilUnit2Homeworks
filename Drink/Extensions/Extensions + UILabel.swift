import UIKit

extension UILabel {
    func setupTitleLabel(size: CGFloat) {
        self.numberOfLines = 0
        self.font = .init(name: ConstantsFont.titleFont, size: size)
        self.textColor = ConstantsColor.titleColor
    }
    
    func setupDescriptionLabel(size: CGFloat) {
        self.numberOfLines = 0
        self.font = .init(name: ConstantsFont.descriptionFont, size: size)
        self.textColor = ConstantsColor.descriptionColor
        self.sizeToFit()
    }
}
