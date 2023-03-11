//
//  FlipBackTableViewCell.swift
//  FlipCellDemo
//
//  Created by Apple on 15/12/22.
//

import UIKit

class FlipBackTableViewCell: UITableViewCell {

    //MARK: cell Outlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImageView: UIImageView!
    
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
