//
//  EquipmentTableViewCell.swift
//  2022-Ukraine-Russia-War-Dataset
//
//  Created by Andrii Stetsenko on 24.07.2022.
//

import UIKit

class EquipmentTableViewCell: UITableViewCell {

    // MARK: - Life cycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.selectionStyle = UITableViewCell.SelectionStyle.none
    }

}
