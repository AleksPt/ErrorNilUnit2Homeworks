import UIKit

extension UIView {
    func addGradient(
        firstColor: UIColor?,
        secondColor: UIColor?,
        thirdColor: UIColor?
    ) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [
            firstColor?.cgColor ?? UIColor.black,
            secondColor?.cgColor ?? UIColor.black,
            thirdColor?.cgColor ?? UIColor.black
        ]
        gradient.locations = [0.0, 0.5, 1.0]
        gradient.startPoint = CGPoint(x: 1, y: 0)
        gradient.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradient, at: 0)
    }
}
