//
//  ViewController.swift
//  Contacts
//
//  Created by Daniil on 21.02.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var contacts = [ContactProtocol]()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadContacts()
    }
    
    private func loadContacts() {
        contacts.append(Contact(title: "Женечка ", phone: "+375333944491"))
        contacts.append(Contact(title: "Даня", phone: "+375333656141"))
        contacts.append(Contact(title: "Дарья", phone: "+375297863986"))
        contacts.sort{ $0.title < $1.title}
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    private func configure(cell: inout UITableViewCell, for indexPath: IndexPath) {
        var configuration = cell.defaultContentConfiguration()
        configuration.text = contacts[indexPath.row].title
        configuration.secondaryText = contacts[indexPath.row].phone 
        cell.contentConfiguration = configuration
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell
        if let reuseCell = tableView.dequeueReusableCell(withIdentifier: "MyCell") {
            print("Используем старую ячейку для строки с индексом \(indexPath.row)")
            cell = reuseCell
        } else {
            print("Создадим новую ячейку для строки с индексом \(indexPath.row)")
            cell = UITableViewCell(style: .default, reuseIdentifier: "MyCell")
        }
        configure(cell: &cell, for: indexPath)
        return cell
    }
}
