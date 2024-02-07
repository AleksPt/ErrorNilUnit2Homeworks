import UIKit

private var alertIsShowed = false

final class BasketballViewController: UIViewController {

    var originBall: CGPoint?
    
    var myScore = 0
    var opponentScore = 0
    
    private lazy var arena: UIImageView = {
        $0.frame = CGRect(
            x: 0,
            y: view.center.y - 250,
            width: view.frame.width,
            height: 500
        )
        $0.contentMode = .scaleAspectFit
        $0.image = .arena
        return $0
    }(UIImageView())
    
    private lazy var ball: UIImageView = {
        let panGest = UIPanGestureRecognizer(target: self, action: #selector(panGesture))
        $0.addGestureRecognizer(panGest)
        $0.image = .ball
        $0.contentMode = .scaleAspectFit
        $0.frame = CGRect(
            x: view.center.x - 25,
            y: view.center.y - 25,
            width: 50,
            height: 50
        )
        $0.isUserInteractionEnabled = true
        originBall = $0.frame.origin
        return $0
    }(UIImageView())
    
    private lazy var myBasket: UIView = {
        $0.frame = CGRect(
            x: view.center.x - 15,
            y: view.center.y + 180,
            width: 30,
            height: 30
        )
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .red
        $0.layer.opacity = 0.5
        return $0
    }(UIView())
    
    private lazy var opponentBasket: UIView = {
        $0.frame = CGRect(
            x: view.center.x - 15,
            y: view.center.y - 215,
            width: 30,
            height: 30
        )
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .green
        $0.layer.opacity = 0.5
        return $0
    }(UIView())
    
    private lazy var restartButton: UIButton = {
        $0.setTitle("Continue?", for: .normal)
        $0.frame = CGRect(x: view.center.x - 60, y: view.center.y - 25, width: 120, height: 50)
        $0.backgroundColor = .systemPink
        $0.layer.cornerRadius = 15
        $0.setTitleColor(.white, for: .normal)
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        $0.isHidden = true
        return $0
    }(UIButton(primaryAction: restartAction))
    
    private lazy var restartAction = UIAction { _ in
        self.restartButton.isHidden = true
        self.ball.frame.origin = self.originBall ?? .zero
        UIView.animate(withDuration: 0.3) {
            self.ball.layer.opacity = 1
        }
    }
    
    private lazy var scoreLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Счет:\n\(myScore) - \(opponentScore)"
        $0.textAlignment = .center
        $0.textColor = .white
        $0.numberOfLines = 0
        $0.sizeToFit()
        $0.font = .systemFont(ofSize: 30, weight: .semibold)
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        view.addSubview(arena)
        view.addSubview(ball)
        view.addSubview(myBasket)
        view.addSubview(opponentBasket)
        view.addSubview(restartButton)
        view.addSubview(scoreLabel)
        setupConstraints()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if !alertIsShowed {
            showAlert()
        }
    }
    
    @objc func panGesture(_ sender: UIPanGestureRecognizer) {
        guard let panView = sender.view else { return }
        let newOrigin = sender.translation(in: panView)
        
        panView.center = CGPoint(
            x: panView.center.x + newOrigin.x,
            y: panView.center.y + newOrigin.y
        )
        
        sender.setTranslation(.zero, in: panView)
        
        switch sender.state {
        case .ended:
            if panView.frame.intersects(opponentBasket.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.opponentScore += 1
                    panView.layer.opacity = 0
                    self.restartButton.isHidden = false
                }
            } else if panView.frame.intersects(myBasket.frame) {
                UIView.animate(withDuration: 0.3) {
                    self.myScore += 1
                    panView.layer.opacity = 0
                    self.restartButton.isHidden = false
                }
            } else {
                UIView.animate(withDuration: 0.3) {
                    panView.frame.origin = self.originBall ?? .zero
                }
            }
            scoreLabel.text = "Счет:\n\(myScore) - \(opponentScore)"
        default:
            break
        }
    }
    
}

extension BasketballViewController {
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            scoreLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scoreLabel.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
}

extension BasketballViewController {
    private func showAlert() {
        let alert = UIAlertController(
            title: "Добро пожаловать в NBA курильщика!",
            message: "Просто тяните мяч в сторону кольца\n🫤",
            preferredStyle: .alert
        )
        let btn = UIAlertAction(title: "Сомнительно, но окэй", style: .cancel) { _ in
            alertIsShowed.toggle()
        }
        alert.addAction(btn)
        present(alert, animated: true)
    }
}
