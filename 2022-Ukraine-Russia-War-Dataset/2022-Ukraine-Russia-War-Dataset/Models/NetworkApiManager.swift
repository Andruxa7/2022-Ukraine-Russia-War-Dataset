//
//  NetworkApiManager.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 23.07.2022.
//

import Foundation

class NetworkApiManager {
    
    enum RequestType {
        case personnel
        case equipment
    }
    
    var onCompletionPersonnel: (([Personnel]) -> Void)?
    var onCompletionEquipment: (([Equipment]) -> Void)?
    
    func fetchCurrentData(forRequestType requestType: RequestType) {
        var urlString = ""
        switch requestType {
        case .personnel:
            urlString = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
        case .equipment:
            urlString = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
        }
        performRequest(withURLString: urlString, from: requestType)
    }
    
    fileprivate func performRequest(withURLString urlString: String, from requestType: RequestType) {
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                switch requestType {
                case .personnel:
                    if let currentData = self.parsePersonnelJSON(withData: data) {
                        self.onCompletionPersonnel?(currentData)
                    }
                case .equipment:
                    if let currentData = self.parseEquipmentlJSON(withData: data) {
                        self.onCompletionEquipment?(currentData)
                    }
                }
            }
        }
        task.resume()
    }
    
    fileprivate func parsePersonnelJSON(withData data: Data) -> [Personnel]? {
        let decoder = JSONDecoder()
        do {
            let currentPersonnel = try decoder.decode([Personnel].self, from: data)
            return currentPersonnel
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
    fileprivate func parseEquipmentlJSON(withData data: Data) -> [Equipment]? {
        let decoder = JSONDecoder()
        do {
            let currentEquipment = try decoder.decode([Equipment].self, from: data)
            return currentEquipment
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
}
