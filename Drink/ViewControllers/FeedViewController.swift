import UIKit

final class FeedViewController: UIViewController {
    
    private let collectionData = [CocktailModel.mockData()]
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        $0.register(FeedCell.self, forCellWithReuseIdentifier: FeedCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.backgroundColor = .red
    }

}

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
        
        
        
        return cell
    }
    
    
}
