import UIKit

protocol AboutCityDelegate {
    func setInfoAboutCity(
        image: UIImage,
        title: String,
        description: String
    )
}

final class AboutCity: UIViewController {
    
    // MARK: - Public Properties
    private lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInsetAdjustmentBehavior = .never
        $0.addSubview(scrollViewContent)
        return $0
    }(UIScrollView())
    
    private lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(photo)
        $0.addSubview(text)
        $0.addSubview(titleLabel)
        return $0
    }(UIView())
    
    private  lazy var photo: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 30
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.numberOfLines = 0
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private lazy var text: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        setConstraints()
    }
    
    // MARK: - Private Methods
    private func setConstraints() {
        NSLayoutConstraint.activate([

            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            photo.topAnchor.constraint(equalTo: scrollViewContent.topAnchor, constant: 125),
            photo.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            photo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            photo.heightAnchor.constraint(equalTo: photo.widthAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 34),
            titleLabel.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            
            text.leadingAnchor.constraint(equalTo: scrollViewContent.leadingAnchor, constant: 24),
            text.trailingAnchor.constraint(equalTo: scrollViewContent.trailingAnchor, constant: -20),
            text.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 14),
            
            scrollViewContent.bottomAnchor.constraint(equalTo: text.bottomAnchor, constant: 50),
        ])
    }
}

// MARK: - Extensions
extension AboutCity: AboutCityDelegate {
    func setInfoAboutCity(image: UIImage, title: String, description: String) {
        self.photo.image = image
        self.titleLabel.text = title
        self.text.text = description
    }
}
