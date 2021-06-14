//
//  DetailPersonTableViewController.swift
//  Persons List
//
//  Created by Егор Чирков on 09.06.2021.
//

import UIKit
import MessageUI

class DetailPersonTableViewController: UITableViewController {

    private let personList = Person.getPersonList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
    }
  
    override func numberOfSections(in tableView: UITableView) -> Int {
        personList.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let person = personList[section]
        return person.fullName
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath)
        
        let person = personList[indexPath.section]
        var content = cell.defaultContentConfiguration()
        
        if indexPath.row == 0 {
            content.text = person.number
            content.image = UIImage(systemName: "phone")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        } else {
            content.text = person.mail
            content.image = UIImage(systemName: "envelope")?.withTintColor(.systemIndigo, renderingMode: .alwaysOriginal)
        }

        cell.contentConfiguration = content
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let person = personList[indexPath.section]
        
        if indexPath.row == 0 {
            callNumber(phoneNumber: person.number)
        } else {
            sendEmail(email: person.mail)
        }
    }
}

extension DetailPersonTableViewController {
    private func callNumber(phoneNumber: String) {
        guard let url = URL(string: "telprompt://\(phoneNumber)"),
            UIApplication.shared.canOpenURL(url) else {
            return
        }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }
}

extension DetailPersonTableViewController: MFMailComposeViewControllerDelegate {
    func sendEmail(email: String) {
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients([email])
            mail.setSubject("Hello from app")
            
            present(mail, animated: true)
        } else {
            print("error sent mail")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true)
    }
}
