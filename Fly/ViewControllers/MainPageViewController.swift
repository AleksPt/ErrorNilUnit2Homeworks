import UIKit

final class MainPageViewController: UIViewController {

    // MARK: - Private Properties
    private let collectionData = OffersModel.mockData()
    
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
    
    private lazy var arrowsLabel: UILabel = {
        $0.settingLabel(alignment: .right)
        $0.text = "⬅️ ➡️"
        return $0
    }(UILabel())
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(
            width: 200,
            height: view.frame.height
        )
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(
            SliderCell.self,
            forCellWithReuseIdentifier: SliderCell.reuseId
        )
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(
        UICollectionView(
            frame: .zero,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
    )
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setAllSubview()
        setConstraints()
    }
}

// MARK: - Extensions
extension MainPageViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        collectionData.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: SliderCell.reuseId,
            for: indexPath
        ) as! SliderCell
        
        let imageName = collectionData[indexPath.item].image
        cell.setPhoto(image: imageName)
        
        let titleLabel = collectionData[indexPath.item].toCity
        cell.setToCityLabel(text: titleLabel)
        
        let descriptionLabel = collectionData[indexPath.item].fromCity
        cell.setFromCityLabel(text: descriptionLabel)
        
        let priceLabel = collectionData[indexPath.item].price
        cell.setPriceLabel(price: priceLabel)
        
        return cell
    }
}

extension MainPageViewController {
    private func setAllSubview() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(arrowsLabel)
        view.addSubview(collectionView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            arrowsLabel.bottomAnchor.constraint(equalTo: collectionView.topAnchor),
            arrowsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 280)
        ])
    }
}
