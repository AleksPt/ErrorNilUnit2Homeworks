import UIKit

final class ActorCell: UICollectionViewCell {
    
    static let reuseId = "ActorCell"
    
    lazy var customView: UIView = {
        $0.backgroundColor = .init(red: 26/255, green: 27/255, blue: 34/255, alpha: 1)
        $0.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        $0.layer.cornerRadius = 20
        return $0
    }(UIView())
    
    lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 25
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = .systemFont(ofSize: 12)
        $0.textColor = .white
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customView)
        addSubview(photo)
        addSubview(title)
        setConstraints()
    }
    
    func setCell(data: Item) {
        self.photo.image = data.picture
        self.title.text = data.fullName
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ActorCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            photo.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 50),
            photo.heightAnchor.constraint(equalToConstant: 50),
            
            title.centerYAnchor.constraint(equalTo: photo.centerYAnchor),
            title.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 20),
//            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
