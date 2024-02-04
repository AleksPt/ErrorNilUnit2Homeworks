import UIKit

class FeedCell: UICollectionViewCell {
    
    static let reuseId = "FeedCell"
    
    private let cellView: UIView = {
        $0.backgroundColor = ConstantsColor.backgroundCellViewColor
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    private lazy var pictureImage: UIImageView = {
        $0.setupImagePreview()
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.setupTitleLabel(size: 30)
        return $0
    }(UILabel())
    
    private lazy var shareImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = .share
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    private lazy var likeImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
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
        addSubview(pictureImage)
        addSubview(titleLabel)
        addSubview(shareImage)
        addSubview(likeImage)
        addSubview(descriptionLabel)
        addSubview(moreButton)
    }
    
    override func prepareForReuse() {
        self.pictureImage.image = nil
        self.titleLabel.text = nil
        self.descriptionLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(picture: UIImage, title: String, description: String) {
        self.pictureImage.image = picture
        self.titleLabel.text = title
        self.descriptionLabel.text = description
        
        let pictureSize = pictureImage.image?.size
        let pictureRatio = (pictureSize?.height ?? 1) / (pictureSize?.width ?? 1)
      
        let viewWidth = UIScreen.main.bounds.width - 40
        let newHeightPicture = viewWidth * pictureRatio
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.bottomAnchor.constraint(equalTo: moreButton.bottomAnchor, constant: 21),
            cellView.widthAnchor.constraint(equalToConstant: viewWidth),
            
            pictureImage.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 0),
            pictureImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor),
            pictureImage.widthAnchor.constraint(equalToConstant: viewWidth),
            pictureImage.heightAnchor.constraint(equalToConstant: newHeightPicture),
            
            titleLabel.topAnchor.constraint(equalTo: pictureImage.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 34),
            titleLabel.trailingAnchor.constraint(equalTo: shareImage.leadingAnchor, constant: -10),
            
            shareImage.topAnchor.constraint(equalTo: likeImage.topAnchor),
            shareImage.trailingAnchor.constraint(equalTo: likeImage.leadingAnchor, constant: -20),
            shareImage.heightAnchor.constraint(lessThanOrEqualTo: likeImage.heightAnchor),
            shareImage.widthAnchor.constraint(lessThanOrEqualTo: likeImage.widthAnchor),
            
            likeImage.topAnchor.constraint(equalTo: pictureImage.bottomAnchor, constant: 20),
            likeImage.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -24),
            likeImage.heightAnchor.constraint(lessThanOrEqualToConstant: 21),
            likeImage.widthAnchor.constraint(lessThanOrEqualToConstant: 21),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            descriptionLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant:  15),
            descriptionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -15),
            
            moreButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 23),
            moreButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor),
            moreButton.trailingAnchor.constraint(equalTo: descriptionLabel.trailingAnchor),
            moreButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
    
}
