//
//  EquipmentDetailsViewController.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 24.07.2022.
//

import UIKit

class EquipmentDetailsViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var dayLable: UILabel!
    @IBOutlet weak var aircraftLable: UILabel!
    @IBOutlet weak var helicopterLable: UILabel!
    @IBOutlet weak var tankLable: UILabel!
    @IBOutlet weak var apcLable: UILabel!
    @IBOutlet weak var fieldArtilleryLable: UILabel!
    @IBOutlet weak var mrlLable: UILabel!
    @IBOutlet weak var militaryAutoLable: UILabel!
    @IBOutlet weak var fuelTankLable: UILabel!
    @IBOutlet weak var droneLable: UILabel!
    @IBOutlet weak var navalShipLable: UILabel!
    @IBOutlet weak var antiAircraftWarfareLable: UILabel!
    @IBOutlet weak var specialEquipmentLable: UILabel!
    @IBOutlet weak var mobileSRBMSystemLable: UILabel!
    @IBOutlet weak var greatestLossesDirectionLable: UILabel!
    @IBOutlet weak var vehiclesAndFuelTanksLable: UILabel!
    @IBOutlet weak var cruiseMissilesLable: UILabel!
    
    
    // MARK: - Variables
    
    var equipement: Equipment?
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let equipment = equipement {
            dateLable.text = "date: \(equipment.date)"
            dayLable.text = "day: \(equipment.day)"
            aircraftLable.text = "aircraft: \(equipment.aircraft)"
            helicopterLable.text = "helicopter: \(equipment.helicopter)"
            tankLable.text = "tank: \(equipment.tank)"
            apcLable.text = "apc: \(equipment.apc)"
            fieldArtilleryLable.text = "fieldArtillery: \(equipment.fieldArtillery)"
            mrlLable.text = "mrl: \(equipment.mrl)"
            militaryAutoLable.text = "militaryAuto: \(equipment.militaryAuto ?? 0)"
            fuelTankLable.text = "fuelTank: \(equipment.fuelTank ?? 0)"
            droneLable.text = "drone: \(equipment.drone)"
            navalShipLable.text = "navalShip: \(equipment.navalShip)"
            antiAircraftWarfareLable.text = "antiAircraftWarfare: \(equipment.antiAircraftWarfare)"
            specialEquipmentLable.text = "specialEquipment: \(equipment.specialEquipment ?? 0)"
            mobileSRBMSystemLable.text = "mobileSRBMSystem: \(equipment.mobileSRBMSystem ?? 0)"
            greatestLossesDirectionLable.text = "greatestLossesDirection: \(equipment.greatestLossesDirection ?? "No Location")"
            vehiclesAndFuelTanksLable.text = "vehiclesAndFuelTanks: \(equipment.vehiclesAndFuelTanks ?? 0)"
            cruiseMissilesLable.text = "cruiseMissiles: \(equipment.cruiseMissiles ?? 0)"
        }
    }
    
}
