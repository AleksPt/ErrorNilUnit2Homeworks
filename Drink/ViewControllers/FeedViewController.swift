import UIKit

final class FeedViewController: UIViewController {
        
    // MARK: - Private Properties
    private let collectionData = CocktailModel.mockData()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
    
        $0.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.reuseId)
        $0.dataSource = self
        return $0
    }(
        UICollectionView(
            frame: view.frame,
            collectionViewLayout: UICollectionViewFlowLayout()
        )
    )
    
    // MARK: - View Life Cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.backgroundColor = ConstantsColor.dark
    }

}

// MARK: - UICollectionViewDataSource
extension FeedViewController: UICollectionViewDataSource {
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
            withReuseIdentifier: FeedCell.reuseId,
            for: indexPath
        ) as! FeedCell
        
        cell.setupCell(
            picture: collectionData[indexPath.item].photo,
            title: collectionData[indexPath.item].title,
            description: collectionData[indexPath.item].description
        )
        
        cell.transition = { [weak self] in
            let vc = AboutCocktailViewController()
            let data = self?.collectionData[indexPath.item]
            vc.cocktailItem = data
            self?.navigationController?.pushViewController(vc, animated: true)
        }
                
        return cell
    }
}


