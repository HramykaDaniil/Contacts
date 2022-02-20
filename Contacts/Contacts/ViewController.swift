//
//  ViewController.swift
//  Contacts
//
//  Created by Daniil on 21.02.22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = "Строка \(indexPath.row)"
        cell.contentConfiguration = configuration
        
        return cell
    }
}
