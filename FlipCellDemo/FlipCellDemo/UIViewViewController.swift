//
//  UIViewViewController.swift
//  FlipCellDemo
//
//  Created by Akshay Kumar on 19/12/22.
//

import UIKit

class UIViewViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet weak var flipView: UIView!
    
    //MARK: Define Variabe
    var isFlip = false
    
    
    //MARK: viewdidload
    override func viewDidLoad() {
        super.viewDidLoad()
        flipView.layer.cornerRadius = 20
        
        flipView.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1)
        // Do any additional setup after loading the view.
    }
    
    
    //MARK: UIButton Tapped Action
    @IBAction func flipBackBtnTappedAction(_ sender: Any) {
        if isFlip{
            isFlip = false
            flipView.backgroundColor = UIColor(red: 0.0/255, green: 0.0/255, blue: 0.0/255, alpha: 1)
            UIView.transition(with: flipView, duration: 0.5, options: .transitionFlipFromLeft , animations: nil, completion: nil)
        }
        else{
            isFlip = true
            flipView.backgroundColor = UIColor(red: 20.0/255, green: 200.0/255, blue: 120.0/255, alpha: 1)
            UIView.transition(with: flipView, duration: 0.5, options: .transitionFlipFromRight , animations: nil, completion: nil)
        }
    }
    
}
