import UIKit

final class GenreCell: UICollectionViewCell {
    
    static let reuseId = "GenreCell"
    
    lazy var customView: UIView = {
        $0.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIView())
    
    lazy var title: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.textColor = .white
        $0.font = UIFont(name: "HalvarBreit-XBd", size: 20)
        return $0
    }(UILabel())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(customView)
        addSubview(title)
        setConstraints()
    }
    
    func setCell(data: Item) {
        self.title.text = data.genreTitle
        self.customView.addGradient(
            firstColor: data.colors?[0],
            secondColor: data.colors?[1],
            thirdColor: data.colors?[2]
        )
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension GenreCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
//            title.topAnchor.constraint(equalTo: customView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 20),
            title.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: -15),
            title.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -15)
        ])
    }
}
