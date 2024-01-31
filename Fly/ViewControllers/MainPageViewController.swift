import UIKit

final class MainPageViewController: UIViewController {

    // MARK: - Private Properties
    private let collectionData = OffersModel.mockData()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(
            width: view.frame.width,
            height: view.frame.height
        )
        
        $0.register(
            SliderCell.self,
            forCellWithReuseIdentifier: SliderCell.reuseId
        )
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(
        UICollectionView(
            frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 700),
            collectionViewLayout: UICollectionViewFlowLayout()
        )
    )
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
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
