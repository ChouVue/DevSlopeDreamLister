//
//  ItemCell.swift
//  DevSlopeDreamLister
//
//  Created by Chou Vue on 10/18/17.
//  Copyright © 2017 VUE. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell
{
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var detailLbl: UILabel!
    
    //Primary Configure Cell
    func configureCell(item: Item)
    {
        titleLbl.text = item.title
        priceLbl.text = "$\(item.price)"
        detailLbl.text = item.details
    }
    
}
