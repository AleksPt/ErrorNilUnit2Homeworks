import UIKit

final class ViewController: UIViewController {

    private var collectionData = MockData.getData()
    
    lazy var collectionView: UICollectionView = {
        $0.register(LogoCell.self, forCellWithReuseIdentifier: LogoCell.reuseId)
        $0.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.reuseId)
        $0.register(ActorCell.self, forCellWithReuseIdentifier: ActorCell.reuseId)
        $0.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.reuseId)
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: <#T##UICollectionViewLayout#>))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(collectionView)
    }


}

extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        collectionData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: LogoCell.reuseId,
                for: indexPath
            ) as! LogoCell
            
            let item = collectionData[indexPath.section].items[indexPath.item]
            cell.setCell(data: item)
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PosterCell.reuseId,
                for: indexPath
            ) as! PosterCell
            
            let item = collectionData[indexPath.section].items[indexPath.item]
            cell.setCell(data: item)
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: ActorCell.reuseId,
                for: indexPath
            ) as! ActorCell
            
            let item = collectionData[indexPath.section].items[indexPath.item]
            cell.setCell(data: item)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: GenreCell.reuseId,
                for: indexPath
            ) as! GenreCell
            
            let item = collectionData[indexPath.section].items[indexPath.item]
            cell.setCell(data: item)
            return cell
        }
    }
    
    
}
