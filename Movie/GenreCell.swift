import UIKit

final class GenreCell: UICollectionViewCell {
    
    static let reuseId = "GenreCell"
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font.withSize(15)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        setConstraints()
    }
    
    func setCell(data: Item) {
        self.title.text = data.genreTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenreCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            title.leadingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])
    }
}
