//
//  DatasetTableViewController.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 23.07.2022.
//

import UIKit

class DatasetTableViewController: UITableViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var datasetSegmentedControl: UISegmentedControl!
    
    
    // MARK: - Variables
    
    var networkApiManager = NetworkApiManager()
    
    var personel: [Personnel] = []
    var equipement: [Equipment] = []
    
    var refresh: UIRefreshControl = UIRefreshControl()
    var currentSelected = 0
    
    let personelDetailsIdentifier = "ShowPersonelDetailsVC"
    let equipementDetailsIdentifier = "ShowEquipmentDetailsVC"
    
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshItems(selectedIndex: currentSelected)
        refresh.addTarget(self, action: #selector(refreshTriggered(sedner:)), for: .valueChanged)
        tableView.refreshControl = refresh
    }
    
    
    // MARK: - Actions
    
    @IBAction func choiceSegment(_ sender: UISegmentedControl) {
        currentSelected = sender.selectedSegmentIndex
        refreshItems(selectedIndex: sender.selectedSegmentIndex)
    }
    
    
    // MARK: - Private functions
    
    func refreshItems(selectedIndex: Int) {
        switch selectedIndex {
        case 0:
            if personel.count < 1 {
                reloadPersonel()
            } else {
                tableView.reloadData()
            }
        default:
            if equipement.count < 1 {
                reloadEqipment()
            } else {
                self.tableView.reloadData()
            }
        }
    }
    
    func reloadPersonel() {
        networkApiManager.fetchCurrentData(forRequestType: .personnel)
        networkApiManager.onCompletionPersonnel = { [weak self] personel in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                self.personel = personel
                self.tableView.reloadData()
            }
        }
    }
    
    func reloadEqipment() {
        networkApiManager.fetchCurrentData(forRequestType: .equipment)
        networkApiManager.onCompletionEquipment = { [weak self] equipement in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.refreshControl?.endRefreshing()
                self.equipement = equipement
                self.tableView.reloadData()
            }
        }
    }
    
    @objc func refreshTriggered(sedner: UIRefreshControl) {
        switch currentSelected {
        case 0:
            reloadPersonel()
        default:
            reloadEqipment()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let selectedIndex = self.datasetSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            return personel.count
        case 1:
            return equipement.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let selectedIndex = self.datasetSegmentedControl.selectedSegmentIndex
        switch selectedIndex {
        case 0:
            let personelItem = personel[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PersonnelTableViewCell", for: indexPath)
            cell.textLabel?.text = "\(personelItem.date)"
            return cell
        case 1:
            let equipemntItem = equipement[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "EquipmentTableViewCell", for: indexPath)
            cell.textLabel?.text = "\(equipemntItem.date)"
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedIndex = self.datasetSegmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            let personelItem = personel[indexPath.row]
            performSegue(withIdentifier: personelDetailsIdentifier, sender: personelItem)
        case 1:
            let equipemntItem = equipement[indexPath.row]
            performSegue(withIdentifier: equipementDetailsIdentifier, sender: equipemntItem)
            
        default:
            return
        }
    }
    
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let personelDetailsVC = segue.destination as? PersonelDetailsViewController {
            if segue.identifier == self.personelDetailsIdentifier,
               let personel = sender as? Personnel {
                personelDetailsVC.title = "PersonelDetails"
                personelDetailsVC.personel = personel
            }
        }
        
        if let equipmentDetailsVC = segue.destination as? EquipmentDetailsViewController {
            if segue.identifier == self.equipementDetailsIdentifier,
               let equipement = sender as? Equipment {
                equipmentDetailsVC.title = "EquipementDetails"
                equipmentDetailsVC.equipement = equipement
            }
        }
    }
    
}
