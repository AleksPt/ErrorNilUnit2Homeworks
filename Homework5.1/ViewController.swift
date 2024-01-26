import UIKit

struct CityGuide {
    let photoImage: UIImage
    let titleLabel: String
    let descriptionLabel: String
}

final class ViewController: UIViewController {
    
    // MARK: - Private Properties
    private let tableData = [
        CityGuide(
            photoImage: .barсelona,
            titleLabel: "Барселона",
            descriptionLabel: """
            Население Барселоны — 1 608 680 человек. Это второй город в Испании по численности населения после Мадрида и десятый в Европейском союзе.
            """
        ),
        CityGuide(
            photoImage: .havana,
            titleLabel: "Гавана",
            descriptionLabel: """
            Столица и крупнейший город Республики Куба, политический, экономический и культурный центр страны, одна из 16 её провинций.
            """
        )
    ]
    
    private lazy var tableView: UITableView = {
        $0.dataSource = self
        $0.delegate = self
        $0.register(TableCell.self, forCellReuseIdentifier: "cell")
        $0.backgroundColor = .systemBackground
        return $0
    }(UITableView(frame: view.frame, style: .insetGrouped))
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        view.addSubview(tableView)
    }
}

// MARK: - Extensions
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableCell
        let item = tableData[indexPath.row]
        cell.configCell(item: item)
        cell.selectionStyle = .none
        return cell
    }
}
