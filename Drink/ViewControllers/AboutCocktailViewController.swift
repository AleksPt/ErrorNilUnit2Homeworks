import UIKit

final class AboutCocktailViewController: UIViewController {
    
    var cocktailItem: CocktailModel?
    var ingredients: [CocktailModel.Ingredients] = []
    
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())
    
    private lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(pictureImageView)
        $0.addSubview(titleLabel)
        $0.addSubview(historyLabel)
        $0.addSubview(recipeTableView)
        $0.addSubview(ingredientsTableView)
        return $0
    }(UIView())
    
    private lazy var pictureImageView: UIImageView = {
        $0.setupImagePreview()
        $0.image = cocktailItem?.photo
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.setupTitleLabel(size: 80)
        $0.text = cocktailItem?.title
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var historyLabel: UILabel = {
        $0.setupDescriptionLabel(size: 14)
        $0.text = cocktailItem?.history
        $0.textColor = .white
        return $0
    }(UILabel())
    
    private lazy var recipeTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = ConstantsColor.dark
        $0.dataSource = self
        $0.delegate = self
        $0.register(RecipeCell.self, forCellReuseIdentifier: RecipeCell.reuseId)
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
        
    private lazy var ingredientsTableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = ConstantsColor.dark
        $0.dataSource = self
        $0.delegate = self
        $0.register(IngredientsCell.self, forCellReuseIdentifier: IngredientsCell.reuseId)
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ConstantsColor.dark
        view.addSubview(scrollView)
        
        parsingIngredientsModel()
        setupConstraints()
    }
    
    private func parsingIngredientsModel() {
        if let items = cocktailItem?.ingredients {
            for item in items {
                let oneIng = CocktailModel.Ingredients(
                    ingredient: item.key,
                    value: item.value
                )
                ingredients.append(oneIng)
            }
        }
    }
}

// MARK: - Setup constraints
extension AboutCocktailViewController {
    private func setupConstraints() {
        let pictureSize = pictureImageView.image?.size
        let pictureRatio = (pictureSize?.height ?? 1) / (pictureSize?.width ?? 1)
      
        let viewWidth = UIScreen.main.bounds.width
        let newHeightPicture = viewWidth * pictureRatio
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            pictureImageView.topAnchor.constraint(equalTo: scrollViewContent.topAnchor),
            pictureImageView.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 18),
            pictureImageView.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -18),
            pictureImageView.heightAnchor.constraint(equalToConstant: newHeightPicture),
            
            titleLabel.topAnchor.constraint(equalTo: pictureImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            
            historyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            historyLabel.leadingAnchor.constraint(equalTo: pictureImageView.leadingAnchor),
            historyLabel.trailingAnchor.constraint(equalTo: pictureImageView.trailingAnchor),
            
            recipeTableView.topAnchor.constraint(equalTo: historyLabel.bottomAnchor, constant: 30),
            recipeTableView.leadingAnchor.constraint(equalTo: historyLabel.leadingAnchor, constant: -10),
            recipeTableView.trailingAnchor.constraint(equalTo: historyLabel.trailingAnchor, constant: 10),
            recipeTableView.heightAnchor.constraint(equalToConstant: CGFloat(60 * (cocktailItem?.recipe.count ?? 1))),
            
            ingredientsTableView.topAnchor.constraint(equalTo: recipeTableView.bottomAnchor),
            ingredientsTableView.leadingAnchor.constraint(equalTo: recipeTableView.leadingAnchor),
            ingredientsTableView.trailingAnchor.constraint(equalTo: recipeTableView.trailingAnchor),
            ingredientsTableView.heightAnchor.constraint(equalToConstant: CGFloat(50 * ingredients.count)),

            scrollViewContent.bottomAnchor.constraint(equalTo: ingredientsTableView.bottomAnchor),
        ])
    }
}


// MARK: - UITableViewDataSource
extension AboutCocktailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == recipeTableView {
            cocktailItem?.recipe.count ?? 0
        } else {
            ingredients.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == recipeTableView {
            let cell = recipeTableView.dequeueReusableCell(withIdentifier: RecipeCell.reuseId, for: indexPath) as! RecipeCell
            let item = cocktailItem?.recipe[indexPath.row]
            cell.configCell(item: item ?? "")
            cell.selectionStyle = .none
            return cell
        } else {
            let cell = ingredientsTableView.dequeueReusableCell(withIdentifier: IngredientsCell.reuseId, for: indexPath) as! IngredientsCell
            let item = ingredients[indexPath.row]
            cell.configCell(ingredient: item.ingredient, capacity: item.value)
            cell.selectionStyle = .none
            return cell
        }
    }
}

// MARK: - UITableViewDelegate
extension AboutCocktailViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.setupTitleLabel(size: 20)
        label.textColor = ConstantsColor.light
        label.translatesAutoresizingMaskIntoConstraints = true
        
        if tableView == recipeTableView {
            label.text = "Рецепт"
        } else {
            label.text = "Ингредиенты"
        }
        
        return label
    }
}
