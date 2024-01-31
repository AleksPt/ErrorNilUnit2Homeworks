import UIKit

final class OnboardingCell: UICollectionViewCell {
    
    static let reuseId = "OnboardingCell"
    
    // MARK: - Public Properties
    var nextClosure: (()->())?
    var transitionOnAuthVC: (()->())?
    
    // MARK: - Private Properties
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
        $0.settingLabel()
        $0.font = .init(name: "GillSans-SemiBold", size: 35)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var continueButton: UIButton = {
        $0.settingButton(
            title: "Полетели!",
            titleColor: mainColor,
            backgroundColor: .white,
            isAutoresizing: true
        )
        return $0
    }(
        UIButton(
            frame: CGRect(
                x: 20,
                y: bounds.height - 120,
                width: bounds.width - 40,
                height: 50
            ),
            primaryAction: continueAction
        )
    )
    
    private lazy var continueAction = UIAction { [weak self] _  in
        self?.transitionOnAuthVC?()
    }
    
    private lazy var nextSlideButton: UIButton = {
        $0.settingButton(
            title: "→",
            titleColor: mainColor,
            backgroundColor: .white,
            isAutoresizing: true
        )
        $0.frame.origin.x = frame.width / 2 - 25
        $0.frame.origin.y = bounds.height - 120
        $0.frame.size = CGSize(width: 50, height: 50)
        return $0
    }(UIButton(primaryAction: nextSlideAction))
    
    private lazy var nextSlideAction = UIAction { [weak self] _ in
        self?.nextClosure?()
    }
    
    // MARK: - Overrides Methods
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
    
}

// MARK: - Extension
extension OnboardingCell {
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


