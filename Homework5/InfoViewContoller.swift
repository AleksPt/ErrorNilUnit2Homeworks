import Foundation
import UIKit

final class InfoViewController: UIViewController {
    
    // MARK: - Private Properties
    private let membersAvengers = [
        "Hulk",
        "Thor",
        "Captain America",
        "Black Widow",
        "Hawkeye"
    ]
    
    private let villains = [
        "Loki",
        "Thanos",
        "Ultron"
    ]

    private lazy var tableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        $0.delegate = self
        return $0
    }(
        UITableView(
            frame: view.frame,
            style: .insetGrouped
        )
    )
    
    // MARK: - Overrides Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "More info"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
    }
    
}

// MARK: - Extensions
extension InfoViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return membersAvengers.count
        } else {
            return villains.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        if indexPath.section == 0 {
            let item = membersAvengers[indexPath.row]
            cell.textLabel?.text = item
        } else {
            let item = villains[indexPath.row]
            cell.textLabel?.text = item
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Друзья"
        case 1:
            return "Злодеи"
        default:
            return ""
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
