import UIKit

final class TabView: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(goToMain),
            name: .goToMain,
            object: nil
        )
        
        let mainVC = setupViewControllers(
            MainViewController(),
            title: "Main Page",
            image: Image.mainPageImage
        )
        mainVC.tabBarItem.selectedImage = UIImage(systemName: Image.mainPageImageFill)
        
        let catalogVC = setupViewControllers(
            CatalogViewController(),
            title: "Sneakers",
            image: Image.catalogImage
        )
        catalogVC.tabBarItem.selectedImage = UIImage(systemName: Image.catalogImageFill)
        
        let cartVC = setupViewControllers(
            CartViewController(),
            title: "Cart",
            image: Image.cartImage
        )
        cartVC.tabBarItem.selectedImage = UIImage(systemName: Image.cartImageFill)
        
        self.viewControllers = [mainVC, catalogVC, cartVC]
        tabBar.backgroundColor = .white
        tabBar.tintColor = .black
    }

    private func setupViewControllers(
        _ vc: UIViewController,
        title: String,
        image: String
    ) -> UIViewController {
        let vc = UINavigationController(rootViewController: vc)
        vc.tabBarItem.title = title
        vc.tabBarItem.image = UIImage(systemName: image)
        return vc
    }
    
    @objc private func goToMain() {
        self.selectedIndex = 0
    }
    
}
