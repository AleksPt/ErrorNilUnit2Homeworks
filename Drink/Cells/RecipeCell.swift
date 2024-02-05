import UIKit

final class RecipeCell: UITableViewCell {
    
    // MARK: - Public Properties
    static let reuseId = "RecipeCell"
    
    // MARK: - Private Properties
    private lazy var recipeLabel: UILabel = {
        $0.setupDescriptionLabel(size: 14)
        $0.textColor = ConstantsColor.dark
        return $0
    }(UILabel())
    
    // MARK: - Overrides Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(recipeLabel)
        setupConstraints()
    }
    
    override func prepareForReuse() {
        recipeLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - Config Cell
extension RecipeCell {
    func configCell(item: String) {
        self.recipeLabel.text = item
    }
}

// MARK: - Setup Constraints
extension RecipeCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            recipeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            recipeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            recipeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            recipeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -10)
        ])
    }
}
