//
//  ItemCursoTableViewCell.swift
//  InnovaSchool
//
//  Created by DAMII on 7/11/23.
//

import UIKit

class ItemCursoTableViewCell: UITableViewCell {

    @IBOutlet weak var lblCurso: UILabel!
    @IBOutlet weak var lblProfesor: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var imgFoto: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
}
