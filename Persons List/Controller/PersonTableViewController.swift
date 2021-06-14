//
//  PersonTableViewController.swift
//  Persons List
//
//  Created by Mac mini on 09.06.2021.
//

import UIKit

class PersonTableViewController: UITableViewController {
    
    private let personList = Person.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
        tableView.separatorInset = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCell", for: indexPath)
        let person = personList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = person.fullName
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? AboutPersonViewController, let indexPath = tableView.indexPathForSelectedRow  else { return }
        
        let person = personList[indexPath.row]
        
        vc.person = person
    }
}
