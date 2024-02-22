import UIKit

final class LogoCell: UICollectionViewCell {
    
    static let reuseId = "LogoCell"
    
    lazy var customView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .black
        $0.layer.cornerRadius = self.frame.width / 2
        $0.layer.borderWidth = 1.5
        $0.layer.borderColor = .init(red: 255/255, green: 45/255, blue: 200/255, alpha: 1)
        return $0
    }(UIView())
    
    lazy var logo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = self.frame.width / 2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customView)
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
            customView.topAnchor.constraint(equalTo: topAnchor),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            logo.topAnchor.constraint(equalTo: topAnchor,constant: 2.5),
            logo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2.5),
            logo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2.5),
            logo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -2.5)
        ])
    }
}
