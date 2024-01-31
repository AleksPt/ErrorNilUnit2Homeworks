import UIKit
protocol OnboardingCellDelegate {
    
}


let mainColor = UIColor(
    red: 78/255,
    green: 100/255,
    blue: 246/255,
    alpha: 1
)

final class OnboardingCell: UICollectionViewCell {
    
    static let reuseId = "OnboardingCell"
    
    private lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    private lazy var customView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = mainColor
        $0.layer.cornerRadius = 40
        $0.clipsToBounds = true
        $0.addSubview(titleLabel)
        return $0
    }(UIView())
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.textAlignment = .center
        $0.font = .init(name: "GillSans-SemiBold", size: 35)
        $0.textColor = .white
        $0.adjustsFontSizeToFitWidth = true
        return $0
    }(UILabel())
    
    private lazy var continueButton: UIButton = {
        $0.setTitle("Полетели!", for: .normal)
        $0.setTitleColor(mainColor, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
        return $0
    }(
        UIButton(
            frame: CGRect(
                x: 20,
                y: bounds.height - 120,
                width: bounds.width - 40,
                height: 50
            )
        )
    )
    
    private lazy var nextSlideButton: UIButton = {
        $0.setTitle("→", for: .normal)
        $0.setTitleColor(mainColor, for: .normal)
        $0.titleLabel?.font = .boldSystemFont(ofSize: 20)
        $0.layer.cornerRadius = 25
        $0.backgroundColor = .white
        $0.center.x = center.x
        $0.frame.origin.y = bounds.height - 120
        $0.frame.size = CGSize(width: 50, height: 50)
        return $0
    }(UIButton(primaryAction: nextSlideAction))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(customView)
        backgroundColor = mainColor
        setConstraints()
    }
    
    override func prepareForReuse() {
        nextSlideButton.removeFromSuperview()
        continueButton.removeFromSuperview()
        imageView.image = nil
        titleLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setImageView(image: UIImage) {
        imageView.image = image
    }
    
    func setTitleLabel(text: String) {
        titleLabel.text = text
    }
    
    func addNextButton() {
        addSubview(nextSlideButton)
    }
    
    func addContinueButton() {
        addSubview(continueButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: customView.topAnchor, constant: 50),
            
            customView.topAnchor.constraint(equalTo: centerYAnchor, constant: 50),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: customView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -100)
        ])
    }
    
}
