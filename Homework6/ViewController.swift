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
        ),
        CityGuide(
            photoImage: .inch,
            titleLabel: "Инчхон",
            descriptionLabel: "Город и порт на Корейском полуострове в Республике Корея. Аванпорт Сеула в заливе Канхваман Жёлтого моря."
        ),
        CityGuide(
            photoImage: .vancouver,
            titleLabel: "Ванкувер",
            descriptionLabel: "Город на западном побережье Канады, крупнейший населённый пункт провинции Британская Колумбия и третий по величине в Канаде. В 2010 году в Ванкувере проводились XXI зимние Олимпийские игры."
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
        title = "Cities Guide 🧭"
        navigationController?.navigationBar.prefersLargeTitles = true
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ScrollView()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
