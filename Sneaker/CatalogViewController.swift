import UIKit
import WebKit

final class CatalogViewController: UIViewController {

    private let collectionData = SneakersModel.mockData()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(
            width: 200,
            height: view.frame.height
        )
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(
            SneakerCell.self,
            forCellWithReuseIdentifier: SneakerCell.reuseId
        )
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Sneakers"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.addSubview(collectionView)
    }
    
}

extension CatalogViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SneakerCell.reuseId, for: indexPath) as! SneakerCell
        
        let image = collectionData[indexPath.item].image
        let title = collectionData[indexPath.item].title
        let price = collectionData[indexPath.item].price
        let url = collectionData[indexPath.item].url
        
        cell.configCell(image: image, title: title, price: price, url: url)
        
        return cell
    }
    
    
}
