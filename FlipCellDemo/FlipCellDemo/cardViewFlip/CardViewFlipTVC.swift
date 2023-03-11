//
//  CardViewFlipTVC.swift
//  FlipCellDemo
//
//  Created by Akshay Kumar on 17/12/22.
//

import UIKit

class CardViewFlipTVC: UITableViewCell {

    //MARK: Cell Outlets
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var dateFrontView: UIView!
    @IBOutlet weak var parisImageView: UIImageView!
    @IBOutlet weak var dateBackView: UIView!
    @IBOutlet weak var dateBackBtn: UIButton!
    @IBOutlet weak var dateFrontBtn: UIButton!
    
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.cornerRadius = 10
        dateFrontView.layer.cornerRadius = 10
        dateBackView.layer.cornerRadius = 10
        parisImageView.layer.cornerRadius = 10
        // Initialization code
    }
    
    //MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
