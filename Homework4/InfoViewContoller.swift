import Foundation
import UIKit

final class InfoViewController: UIViewController {
    let membersAvengers = [
        "Hulk",
        "Thor",
        "Captain America",
        "Black Widow",
        "Hawkeye"
    ]
    
    let villains = [
        "Loki",
        "Thanos",
        "Ultron"
    ]

    lazy var tableView = {
        $0.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        $0.dataSource = self
        return $0
    }(
        UITableView(
            frame: view.frame,
            style: .insetGrouped
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "More info"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(tableView)
    }
    
}

extension InfoViewController: UITableViewDataSource {
    
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
}