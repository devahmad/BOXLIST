//
//  TVCItems.swift
//  BoxList
//
//  Created by DEVaHmad on 4/2/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit

class TVCItems: UITableViewCell {

    @IBOutlet weak var laBoxName: UILabel!
    @IBOutlet weak var laDateAdd: UILabel!
    @IBOutlet weak var ivItemimage: UIImageView!
    @IBOutlet weak var laItemName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setitem(item:Items){
        laItemName.text   = item.item_name
        laBoxName.text    = item.toBox?.box_name
        ivItemimage.image = item.image as? UIImage
        
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "MM/DD/yy h:m a"
        laDateAdd.text = dateFormat.string(from: item.date_add as! Date)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
