//
//  TableViewCell.swift
//  ExpenseManager
//
//  Created by Prakhar Tripathi on 29/04/17.
//  Copyright © 2017 Prakhar Tripathi. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var moneyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
