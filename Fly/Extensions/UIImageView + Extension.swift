import UIKit

extension UIImageView {
    func settingImage() {
        self.layer.cornerRadius = 25
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        self.contentMode = .scaleAspectFill
    }
    
    func addGradient(frame: CGRect) {
            let gradientView = UIImageView(frame: self.frame)
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = frame
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.locations = [0.0, 1.0]
            gradientView.layer.insertSublayer(gradientLayer, at: 0)
            addSubview(gradientView)
        }
}

