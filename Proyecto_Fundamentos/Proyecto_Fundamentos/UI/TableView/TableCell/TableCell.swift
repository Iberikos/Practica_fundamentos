//
//  TableCell.swift
//  Proyecto_Fundamentos
//
//  Created by Rubén Pulido Marchal on 10/4/23.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var IconImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
