import UIKit

final class ActorCell: UICollectionViewCell {
    
    static let reuseId = "ActorCell"
    
    lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = self.frame.width / 2
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font.withSize(15)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            photo.widthAnchor.constraint(equalToConstant: 70),
            
            title.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
