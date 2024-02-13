import UIKit

final class SneakerCell: UICollectionViewCell {
    static let reuseId = "sneakerCell"
    
    var urls = [String: String]()
    
    private lazy var sneakerImage: UIImageView = {
        $0.contentMode = .scaleAspectFit
        $0.frame = CGRect(x: frame.width / 2 - 75, y: 0, width: 150, height: 150)
        
        return $0
    }(UIImageView())
    
    private lazy var sneakerTitle: UILabel = {
        $0.textAlignment = .left
        $0.frame = CGRect(
            x: sneakerImage.frame.minX + 5,
            y: sneakerImage.frame.maxY,
            width: sneakerImage.frame.width,
            height: 40
        )
        $0.font = .systemFont(ofSize: 14)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var sneakerPrice: UILabel = {
        $0.textAlignment = .left
        $0.frame = CGRect(
            x: sneakerTitle.frame.minX,
            y: sneakerTitle.frame.maxY,
            width: sneakerTitle.frame.width,
            height: 20
        )
        $0.font = .systemFont(ofSize: 12)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    private lazy var buyButton: UIButton = {
        $0.setTitle("Купить", for: .normal)
        $0.frame = CGRect(
            x: sneakerImage.frame.minX,
            y: sneakerPrice.frame.maxY + 10,
            width: sneakerImage.frame.width,
            height: 30
        )
        $0.backgroundColor = .black
        $0.layer.cornerRadius = 5
        $0.titleLabel?.font = .boldSystemFont(ofSize: 15)
        $0.tintColor = .white
        return $0
    }(UIButton(primaryAction: buyAction))
    
    private lazy var buyAction = UIAction { _ in
        NotificationCenter.default.post(
            name: .goToShop,
            object: nil,
            userInfo: self.urls
        )
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sneakerImage)
        addSubview(sneakerTitle)
        addSubview(sneakerPrice)
        addSubview(buyButton)
    }
    
    override func prepareForReuse() {
        sneakerImage.image = nil
        sneakerTitle.text = nil
        sneakerPrice.text = nil
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(image: UIImage, title: String, price: Int, url: String) {
        sneakerImage.image = image
        sneakerTitle.text = title
        sneakerPrice.text = "\(price) р."
        urls["url"] = url
    }
    
}
