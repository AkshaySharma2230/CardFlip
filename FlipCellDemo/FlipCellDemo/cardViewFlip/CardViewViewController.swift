//
//  CardViewViewController.swift
//  FlipCellDemo
//
//  Created by Akshay Kumar on 17/12/22.
//

import UIKit


struct flipDateModel {
    var image = ""
    var flipCard = Bool()
    
    init(image: String, flipCard: Bool) {
        self.image = image
        self.flipCard = flipCard
    }
    
}


class CardViewViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    //MARK: Outlets
    @IBOutlet weak var cardTableView: UITableView!
    
    
    //MARK: Define Variables
    var dateModel = [flipDateModel]()
    
    
    //MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardTableView.delegate = self
        cardTableView.dataSource = self
        
        for _ in 0..<7{
            dateModel.append(flipDateModel.init(image: "paris", flipCard: false))
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: TableView delegate & DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dateModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = cardTableView.dequeueReusableCell(withIdentifier: "CardViewFlipTVC") as? CardViewFlipTVC else {
            return UITableViewCell()
        }
        
        cell.parisImageView.image = UIImage(named: dateModel[indexPath.row].image)
        
        cell.dateFrontBtn.tag = indexPath.row
        cell.dateFrontBtn.addTarget(self, action: #selector(CardViewViewController.dateFrontBtnTapped(_:)), for: .touchUpInside)
        
        
        cell.dateBackBtn.tag = indexPath.row
        cell.dateBackBtn.addTarget(self, action: #selector(CardViewViewController.dateBackBtnTapped(_:)), for: .touchUpInside)
        
        
        if dateModel[indexPath.row].flipCard == false{
//            UIView.transition(with: cell.contentView, duration: 0.6, options: .transitionFlipFromLeft, animations: {() -> Void in
//                cell.contentView.insertSubview(cell.dateFrontView, aboveSubview: cell.dateBackView)
//            }, completion: {(_ finished: Bool) -> Void in
//            })
        }
        else{
            UIView.transition(with: cell.cardView, duration: 0.6, options: .transitionFlipFromLeft, animations: {() -> Void in
                cell.cardView.insertSubview(cell.dateBackView, aboveSubview: cell.dateFrontView)
            }, completion: {(_ finished: Bool) -> Void in
            })
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
    //MARK: Object Functions
    @objc func dateFrontBtnTapped(_ sender: UIButton){
        if dateModel[sender.tag].flipCard == false {
            dateModel[sender.tag].flipCard = true
        }
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        cardTableView.reloadRows(at: [indexPath], with: .none)
        //Do Something here...
    }
    
    @objc func dateBackBtnTapped(_ sender: UIButton){
        if dateModel[sender.tag].flipCard == true {
            dateModel[sender.tag].flipCard = false
        }
        
        let indexPath = IndexPath(row: sender.tag, section: 0)
        cardTableView.reloadRows(at: [indexPath], with: .none)
        //Do Something here...
    }
}
