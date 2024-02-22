import UIKit

final class LogoCell: UICollectionViewCell {
    
    static let reuseId = "LogoCell"
    
    lazy var logo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = self.frame.width / 2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(logo)
        setConstraints()
    }
    
    func setCell(data: Item) {
        self.logo.image = data.picture
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LogoCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: topAnchor),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor),
            logo.trailingAnchor.constraint(equalTo: trailingAnchor),
            logo.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
