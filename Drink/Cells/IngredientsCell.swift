import UIKit

final class IngredientsCell: UITableViewCell {

    // MARK: - Public Properties
    static let reuseId = "IngredientsCell"
    
    // MARK: - Private Properties
    private lazy var ingredientLabel: UILabel = {
        $0.setupDescriptionLabel(size: 14)
        $0.textColor = ConstantsColor.dark
        $0.text = "Бурбон"
        return $0
    }(UILabel())
    
    private lazy var capacityLabel: UILabel = {
        $0.setupDescriptionLabel(size: 14)
        $0.textColor = ConstantsColor.dark
        $0.text = "50 мл"
        return $0
    }(UILabel())
    
    // MARK: - Overrides Methods
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(ingredientLabel)
        addSubview(capacityLabel)
        setupConstraints()
    }
    
    override func prepareForReuse() {
        ingredientLabel.text = nil
        capacityLabel.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Config Cell
extension IngredientsCell {
    func configCell(ingredient: String, capacity: String) {
        self.ingredientLabel.text = ingredient
        self.capacityLabel.text = capacity
    }
}

// MARK: - Setup Constraints
extension IngredientsCell {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            ingredientLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            ingredientLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            ingredientLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -10),
            
            capacityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            capacityLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            capacityLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant:  -10),
        ])
    }
}
