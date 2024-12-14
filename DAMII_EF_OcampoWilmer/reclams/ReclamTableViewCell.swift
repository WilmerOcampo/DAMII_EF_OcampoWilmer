//
//  ReclamTableViewCell.swift
//  DAMII_EF_OcampoWilmer
//
//  Created by Wilmer Ocampo on 13/12/24.
//

import UIKit

class ReclamTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var dniLabel: UILabel!
    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var complaintLabel: UILabel!
    @IBOutlet weak var descripLabel: UILabel!
    @IBOutlet weak var storeLabel: UILabel!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
