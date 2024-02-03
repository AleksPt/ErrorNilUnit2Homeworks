import UIKit

class FeedCell: UICollectionViewCell {
    
    static let reuseId = "FeedCell"
    
    private let cellView: UIView = {
//        $0.backgroundColor = ConstantsColor.backgroundViewColor
        $0.backgroundColor = .yellow
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.frame = CGRect(
            x: 0,
            y: 25,
            width: UIScreen.main.bounds.width,
            height: 500
        )
        return $0
    }(UIView())
    
    private lazy var pictureImage: UIImageView = {
        $0.setupImagePreview()
        $0.image = .negroni
        $0.frame = CGRect(
            x: cellView.frame.minX,
            y: cellView.frame.minY,
            width: cellView.frame.width,
            height: 200
        )
        return $0
    }(UIImageView())
    
    private lazy var hStack: UIStackView = {
        $0.frame = CGRect(
            x: pictureImage.frame.minX,
            y: pictureImage.frame.maxY + 20,
            width: UIScreen.main.bounds.width - 100,
            height: 30
        )
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.addArrangedSubview(titleLabel)
        $0.addArrangedSubview(hStackIcon)
        
        return $0
    }(UIStackView())
    
    private lazy var hStackIcon: UIStackView = {
        $0.axis = .horizontal
        $0.distribution = .equalCentering
        $0.addArrangedSubview(shareImage)
        $0.addArrangedSubview(likeImage)
        return $0
    }(UIStackView())
    
    private lazy var titleLabel: UILabel = {
        $0.setupTitleLabel(size: 30)
        $0.text = "Negroni"
        return $0
    }(UILabel())
    
    private lazy var shareImage: UIImageView = {
        $0.image = .share
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var likeImage: UIImageView = {
        $0.image = .like
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var descriptionLabel: UILabel = {
        $0.setupDescriptionLabel(size: 14)
        return $0
    }(UILabel())
    
    private lazy var moreButton: UIButton = {
        $0.setupButton(text: "Подробнее")
        return $0
    }(UIButton())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(cellView)
//        addSubview(pictureImage)
//        addSubview(hStack)
//        addSubview(descriptionLabel)
//        addSubview(moreButton)
    }
    
    override func prepareForReuse() {
        self.pictureImage.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(pickture: UIImage, title: String, description: String) {
        self.pictureImage.image = pickture
        self.titleLabel.text = title
        self.descriptionLabel.text = description
    }
    
}
