import UIKit

private let color = UIColor(
    red: 237 / 255,
    green: 237 / 255,
    blue: 237 / 255,
    alpha: 1
)

final class TableCell: UITableViewCell {
    
    // MARK: - Private Properties
    private lazy var customView: UIView = {
        $0.backgroundColor = color
        $0.layer.cornerRadius = 30
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIView())
    
    private lazy var photoImage: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = .boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.font = .systemFont(ofSize: 16)
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    // MARK: - Initializers
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Overrides Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(customView)
        addSubview(photoImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        setConstraints()
    }
    
    // MARK: - Public Methods
    func configCell(item: CityGuide) {
        self.photoImage.image = item.photoImage
        self.titleLabel.text = item.titleLabel
        self.descriptionLabel.text = item.descriptionLabel
    }
    
    // MARK: - Private Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([
            customView.trailingAnchor.constraint(equalTo: trailingAnchor),
            customView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            customView.leadingAnchor.constraint(equalTo: leadingAnchor),
            customView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            
            photoImage.topAnchor.constraint(equalTo: customView.topAnchor, constant: 14),
            photoImage.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10),
            photoImage.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            photoImage.heightAnchor.constraint(equalTo: photoImage.widthAnchor),
                        
            titleLabel.topAnchor.constraint(equalTo: photoImage.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 34),
            titleLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 7),
            descriptionLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -30),
            descriptionLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10)
        ])
    }
}
