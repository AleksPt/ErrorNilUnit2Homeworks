import UIKit

final class ViewController: UIViewController {

    private var collectionData = MockData.getData()
    
    lazy var collectionView: UICollectionView = {
        $0.register(LogoCell.self, forCellWithReuseIdentifier: LogoCell.reuseId)
        $0.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.reuseId)
        $0.register(ActorCell.self, forCellWithReuseIdentifier: ActorCell.reuseId)
        $0.register(GenreCell.self, forCellWithReuseIdentifier: GenreCell.reuseId)
        $0.backgroundColor = .black
        $0.dataSource = self
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: createSectionLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(collectionView)
    }

    private func createSectionLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { section, _ in
            switch section {
            case 0:
                self.createLogoSection()
            case 1:
                self.createPosterSection()
            case 2:
                self.createActorSection()
            default:
                self.createGenreSection()
            }
        }
    }
    
    private func createLogoSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(100),
            heightDimension: .absolute(90)
        )
        
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 0
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(352),
            heightDimension: .absolute(187)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item, item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 10
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPagingCentered
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 20,
            leading: 0,
            bottom: 0,
            trailing: 30
        )

        return section
    }
    
    private func createActorSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.8)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.7),
            heightDimension: .estimated(100)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item, item, item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 30,
            leading: 10,
            bottom: 30,
            trailing: 30
        )

        return section
    }
    
    private func createGenreSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        item.contentInsets = NSDirectionalEdgeInsets(
            top: 10,
            leading: 0,
            bottom: 0,
            trailing: 0
        )
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(90)
        )
        
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        group.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 0,
            trailing: 10
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0,
            leading: 10,
            bottom: 30,
            trailing: 10
        )

        return section
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
