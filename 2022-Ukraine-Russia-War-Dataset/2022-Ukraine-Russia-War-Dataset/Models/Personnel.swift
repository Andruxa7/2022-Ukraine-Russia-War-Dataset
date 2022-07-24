//
//  Personnel.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 23.07.2022.
//

import Foundation

// MARK: - Personnel
struct Personnel: Codable {
    let date: String
    let day, personnel: Int
    let personnelPersonnel: PersonnelEnum
    let pow: Int?

    enum CodingKeys: String, CodingKey {
        case date, day, personnel
        case personnelPersonnel = "personnel*"
        case pow = "POW"
    }
}

enum PersonnelEnum: String, Codable {
    case about = "about"
    case more = "more"
}
