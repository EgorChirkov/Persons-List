//
//  AboutPersonViewController.swift
//  Persons List
//
//  Created by Mac mini on 09.06.2021.
//

import UIKit

class AboutPersonViewController: UIViewController {

    @IBOutlet weak var imgMail: UIImageView!
    @IBOutlet weak var imgPhone: UIImageView!
    @IBOutlet weak var lblMail: UILabel!
    @IBOutlet weak var lblPhone: UILabel!
    
    var person: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = person.fullName

        lblMail.text = person.mail
        lblPhone.text = person.number
        imgMail.image = UIImage(systemName: "envelope")
        imgPhone.image = UIImage(systemName: "phone")
    }
    

}
