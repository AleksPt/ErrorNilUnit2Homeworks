import UIKit

final class ViewController: UIViewController {

    let collectionData = OnboardingModel.mockData()
    
    private lazy var collectionView: UICollectionView = {
        let layout = $0.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height)
        
        $0.register(OnboardingCell.self, forCellWithReuseIdentifier: OnboardingCell.reuseId)
        $0.dataSource = self
        $0.isPagingEnabled = true
        $0.showsHorizontalScrollIndicator = false
        return $0
    }(UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionData.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OnboardingCell.reuseId, for: indexPath) as! OnboardingCell
        
        let imageName = collectionData[indexPath.item].image
        cell.setImageView(image: imageName)
        
        let titleLabel = collectionData[indexPath.item].title
        cell.setTitleLabel(text: titleLabel)
        
        if indexPath.item == collectionData.count - 1 {
            cell.addContinueButton()
        } else {
            cell.addNextButton()
        }
        
        cell.nextClosure = { [weak self] in
            let nextIndexPath = IndexPath(item: indexPath.item + 1, section: 0)
            self?.collectionView.scrollToItem(at: nextIndexPath, at: .left, animated: true)
        }
        
        return cell
    }
}
