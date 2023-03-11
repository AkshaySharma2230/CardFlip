//
//  FlipedCellTableViewCell.swift
//  FlipCellDemo
//
//  Created by Apple on 15/12/22.
//

import UIKit

class FlipedCellTableViewCell: UITableViewCell {

    //MARK: cell Outlets
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var cellImageVIew: UIImageView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var flipBackBtn: UIButton!
    @IBOutlet weak var flipFrontBtn: UIButton!
    @IBOutlet weak var frontImageView: UIImageView!
    @IBOutlet weak var frontCellView: UIView!
    @IBOutlet weak var flipBackLbl: UILabel!
    @IBOutlet weak var flipFrontLbl: UILabel!
    @IBOutlet weak var dateViewBack: UIView!
    @IBOutlet weak var dateViewFront: UIView!
    
    
    
    //MARK: awakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cellView.layer.cornerRadius = 10
        cellImageVIew.layer.cornerRadius = 10
        
        frontCellView.layer.cornerRadius = 10
        frontImageView.layer.cornerRadius = 10
        
        dateViewBack.layer.cornerRadius = 10
        dateViewFront.layer.cornerRadius = 10
        
        //frontView.isHidden = true
        // Initialization code
    }

    
    //MARK: setSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
//    @IBAction func flipBackBtnAction(_ sender: UIButton) {
//        UIView.transition(with: contentView, duration: 0.6, options: .transitionFlipFromLeft, animations: {() -> Void in
//            self.contentView.insertSubview(self.frontView, aboveSubview: self.backView)
//            }, completion: {(_ finished: Bool) -> Void in
//            })
//    }
//    
//    
//    @IBAction func flipFrontBtnAction(_ sender: Any) {
//        UIView.transition(with: contentView, duration: 0.6, options: .transitionFlipFromRight, animations: {() -> Void in
//            self.contentView.insertSubview(self.backView, aboveSubview: self.frontView)
//           }, completion: {(_ finished: Bool) -> Void in
//           })
//        
//    }
    
}
