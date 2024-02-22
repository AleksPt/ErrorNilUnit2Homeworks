import UIKit

final class PosterCell: UICollectionViewCell {
    
    static let reuseId = "PosterCell"
    
    lazy var poster: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(poster)
        setConstraints()
    }
    
    func setCell(data: Item) {
        self.poster.image = data.picture
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PosterCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            poster.topAnchor.constraint(equalTo: topAnchor),
            poster.leadingAnchor.constraint(equalTo: leadingAnchor),
            poster.trailingAnchor.constraint(equalTo: trailingAnchor),
            poster.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
