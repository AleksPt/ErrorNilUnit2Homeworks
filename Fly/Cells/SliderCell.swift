import UIKit

final class SliderCell: UICollectionViewCell {
    
    static let reuseId = "SliderCell"
    
    // MARK: - Private Properties
    private lazy var titleLabel: UILabel = {
        $0.settingTitleLabel(text: "Лучшие предложения")
        return $0
    }(UILabel())
    
    private lazy var descriptionLabel: UILabel = {
        $0.settingLabel(alignment: .right)
        $0.text = "Билеты по выгодным ценам"
        $0.font = .systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    private lazy var photo: UIImageView = {
        $0.settingImage()
        $0.addGradient(frame: CGRect(x: 0, y: frame.midY, width: frame.width, height: frame.width / 1.5))
        return $0
    }(UIImageView())
    
    private lazy var toCityLabel: UILabel = {
        $0.settingLabel(alignment: .right)
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    private lazy var fromCityLabel: UILabel = {
        $0.settingLabel(alignment: .right)
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 10)
        return $0
    }(UILabel())
    
    private lazy var priceLabel: UILabel = {
        $0.settingLabel(alignment: .right)
        $0.textColor = .white
        $0.font = .boldSystemFont(ofSize: 16)
        return $0
    }(UILabel())
    
    // MARK: - Overrides Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(photo)
        addSubview(toCityLabel)
        addSubview(fromCityLabel)
        addSubview(priceLabel)
        setConstraints()
    }
    
    override func prepareForReuse() {
        photo.image = nil
        toCityLabel.text = nil
        fromCityLabel.text = nil
        priceLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions
extension SliderCell {
    
    func setPhoto(image: UIImage) {
        photo.image = image
    }
    
    func setToCityLabel(text: String) {
        toCityLabel.text = text
    }
    
    func setFromCityLabel(text: String) {
        fromCityLabel.text = text
    }
    
    func setPriceLabel(price: Int) {
        priceLabel.text = "от \(price)₽"
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 300),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -300),
            
            toCityLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: -70),
            toCityLabel.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 15),
            
            fromCityLabel.topAnchor.constraint(equalTo: toCityLabel.bottomAnchor, constant: 5),
            fromCityLabel.leadingAnchor.constraint(equalTo: toCityLabel.leadingAnchor),
            
            priceLabel.topAnchor.constraint(equalTo: fromCityLabel.bottomAnchor, constant: 5),
            priceLabel.leadingAnchor.constraint(equalTo: toCityLabel.leadingAnchor)
        ])
    }
}
