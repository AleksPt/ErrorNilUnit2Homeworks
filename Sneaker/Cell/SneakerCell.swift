import UIKit

final class SneakerCell: UICollectionViewCell {
    static let reuseId = "sneakerCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func prepareForReuse() {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configCell(image: UIImage, title: String, price: Int, url: String) {
        
    }
    
}
