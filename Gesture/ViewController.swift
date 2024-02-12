import UIKit

final class ViewController: UIViewController {
        
    private lazy var backView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleAspectFill
        $0.image = .background
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = { return $0 }(
        setupLabels(
            text: "Оцените работу",
            size: 40,
            weight: .bold
        )
    )
    
    private lazy var descriptionLabel: UILabel = { return $0 }(
        setupLabels(
            text: "Насколько вы довольны качеством предоставленной услуги?",
            size: 16,
            weight: .regular
        )
    )
    
    private lazy var nameLabel: UILabel = { return $0 }(
        setupLabels(
            text: "Татьяна Л.",
            size: 14,
            weight: .regular
        )
    )
    
    private lazy var avatar: UIImageView = {
        $0.image = .avatar
        $0.contentMode = .scaleAspectFill
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UIImageView())
    
    private lazy var hStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.spacing = 11
        $0.distribution = .fillEqually
        $0.addArrangedSubview(star1)
        $0.addArrangedSubview(star2)
        $0.addArrangedSubview(star3)
        $0.addArrangedSubview(star4)
        $0.addArrangedSubview(star5)
        return $0
    }(UIStackView())
    
    private lazy var star1: UIImageView = {
        $0.tag = 1
        return $0
    }(setupStarView())
    
    private lazy var star2: UIImageView = {
        $0.tag = 2
        return $0
    }(setupStarView())
    
    private lazy var star3: UIImageView = {
        $0.tag = 3
        return $0
    }(setupStarView())
    
    private lazy var star4: UIImageView = {
        $0.tag = 4
        return $0
    }(setupStarView())
    
    private lazy var star5: UIImageView = {
        $0.tag = 5
        return $0
    }(setupStarView())
    
    private lazy var starFill: UIImageView = {
        $0.image = .starFill
        $0.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        return $0
    }(UIImageView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(backView)
        view.addSubview(hStack)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(avatar)
        view.addSubview(nameLabel)
        setConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .fastForward,
            target: self,
            action: #selector(secondVC)
        )
    }
    
    private func setupStarView() -> UIImageView {
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(tapFunc)
        )
        let img = UIImageView()
        img.addGestureRecognizer(tapGesture)
        img.image = .starNoFill
        img.isUserInteractionEnabled = true
        return img
    }
    
    private func setupLabels(
        text: String,
        size: CGFloat,
        weight: UIFont.Weight
    ) -> UILabel {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.sizeToFit()
        label.text = text
        label.font = .systemFont(ofSize: size, weight: weight)
        return label
    }
    
    @objc func tapFunc(_ sender: UITapGestureRecognizer) {
        sender.view?.addSubview(self.starFill)
    }
    
    @objc func secondVC() {
        let vc = BasketballViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}



// MARK: - Setup constraints
extension ViewController {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backView.topAnchor.constraint(equalTo: view.topAnchor),
            backView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -20),
            titleLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: avatar.topAnchor, constant: -25),
            descriptionLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            
            nameLabel.widthAnchor.constraint(equalToConstant: view.frame.width),
            nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 5),
            
            hStack.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            hStack.widthAnchor.constraint(equalToConstant: 300),
            hStack.heightAnchor.constraint(equalToConstant: 50),
            hStack.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20)
        ])
    }
}
