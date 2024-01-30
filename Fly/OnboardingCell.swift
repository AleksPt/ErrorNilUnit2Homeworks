import UIKit

final class OnboardingCell: UICollectionViewCell {
    
    static let reuseId = "OnboardingCell"
    
    private lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView(frame: bounds))
    
    private lazy var customView: UIView = {
        $0.backgroundColor = .white
        return $0
    }(UIView())
    
    private lazy var titleLabel: UILabel = {
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(customView)
        addSubview(titleLabel)
    }
    
    override func prepareForReuse() {
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
    
}
