//
//  PersonelDetailsViewController.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 23.07.2022.
//

import UIKit

class PersonelDetailsViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var personnelLabel: UILabel!
    @IBOutlet weak var personnel_Lable: UILabel!
    @IBOutlet weak var powLable: UILabel!
    
    
    // MARK: - Variables
    
    var personel: Personnel?
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        if let personel = personel {
            dateLable.text = "date: \(personel.date)"
            dayLable.text = "day: \(personel.day)"
            personnelLabel.text = "personnel: \(personel.personnel)"
            personnel_Lable.text = "personnel*: \(personel.personnelPersonnel)"
            powLable.text = "POW: \(personel.pow ?? 0)"
        }
    }
}
