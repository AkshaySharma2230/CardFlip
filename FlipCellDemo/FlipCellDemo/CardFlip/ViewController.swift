//
//  ViewController.swift
//  FlipCellDemo
//
//  Created by Apple on 15/12/22.
//

import UIKit

struct FlipcardValue {
    var imageName = ""
    var frontViewName = ""
    var backViewName = ""
    var flip = false
    
    init(imageName: String, flip: Bool, frontViewName: String, backViewName : String) {
        self.imageName = imageName
        self.flip = flip
        self.frontViewName = frontViewName
        self.backViewName = backViewName
    }
    
}


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //MARK: Cell Outlets
    @IBOutlet weak var flipedTableVIew: UITableView!
    
    
    //MARK: Define Variable
    var isFirstCell = true
    var indexOfSwappingCell: Int = 0
    var cellImagedata = [FlipcardValue]()
    var buttonTappedVal = false
    
    
    //MARK: viewDidload
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<7 {
            cellImagedata.append(FlipcardValue.init(imageName: "paris", flip: false, frontViewName: "Front View", backViewName: "BackView"))
        }
        // Do any additional setup after loading the view.
    }
    
    
    
    //MARK: UITableView Dellegate & DataSource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellImagedata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FlipedCellTableViewCell") as? FlipedCellTableViewCell else {
            return UITableViewCell()
        }
        cell.cellImageVIew.image = UIImage(named: cellImagedata[indexPath.row].imageName)
        //cell.flipFrontLbl.text = "Font View"
        //cell.flipBackLbl.text = "Back View"
//        cell.flipFrontLbl.text = cellImagedata[indexPath.row].frontViewName
//        cell.flipBackLbl.text = cellImagedata[indexPath.row].backViewName
        
        cell.flipFrontBtn.tag = indexPath.row
        cell.flipFrontBtn.addTarget(self, action: #selector(ViewController.flipFrontBtnTappedAction(sender:)), for: .touchUpInside)
        
        
        cell.flipBackBtn.tag = indexPath.row
        cell.flipBackBtn.addTarget(self, action: #selector(ViewController.flipBackBtnTappedAction(sender:)), for: .touchUpInside)
        
        
        if buttonTappedVal == true {
            if cellImagedata[indexPath.row].flip == false {

                UIView.transition(with: cell.contentView, duration: 0.6, options: .transitionFlipFromLeft, animations: {() -> Void in
                    cell.contentView.insertSubview(cell.frontView, aboveSubview: cell.backView)
                }, completion: {(_ finished: Bool) -> Void in
                })
                //cell.flipFrontLbl.text = "Font View"
                buttonTappedVal = false
            }
            else{

                UIView.transition(with: cell.contentView, duration: 0.6, options: .transitionFlipFromRight, animations: {() -> Void in
                    cell.contentView.insertSubview(cell.backView, aboveSubview: cell.frontView)
                }, completion: {(_ finished: Bool) -> Void in
                })
                
                //cell.flipBackLbl.text = "Back View"
                buttonTappedVal = false
            }
        }
        
        return cell
    }
        
    @objc func flipFrontBtnTappedAction(sender: UIButton){
        buttonTappedVal = true
        if cellImagedata[sender.tag].flip == false {
            cellImagedata[sender.tag].flip = true
//            cellImagedata[sender.tag].backViewName = "Back View"
//            cellImagedata[sender.tag].frontViewName = "Front View"
        }
        else{
            cellImagedata[sender.tag].flip = false
//            cellImagedata[sender.tag].backViewName = "Back View"
//            cellImagedata[sender.tag].frontViewName = "Front View"
        }
        
        
        //flipedTableVIew.reloadData()
        let indexPath = IndexPath(item: sender.tag, section: 0)
        flipedTableVIew.reloadRows(at: [indexPath], with: .none)
        
       // buttonTappedVal = false
    }
    
    @objc func flipBackBtnTappedAction(sender: UIButton){
        
        buttonTappedVal = true
        if cellImagedata[sender.tag].flip == true {
            cellImagedata[sender.tag].flip = false
            //cellImagedata[sender.tag].backViewName = "Back View"
            //cellImagedata[sender.tag].frontViewName = "Front View"
        }
        else{
            cellImagedata[sender.tag].flip = true
            //cellImagedata[sender.tag].backViewName = "Back View"
            //cellImagedata[sender.tag].frontViewName = "Front View"
        }
        
        //flipedTableVIew.reloadData()
        
        let indexPath = IndexPath(item: sender.tag, section: 0)
        flipedTableVIew.reloadRows(at: [indexPath], with: .none)
        
        //buttonTappedVal = false
    }
    
    
    
//
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//
//        //        cell.transform = CGAffineTransform(rotationAngle: 360)
//        //        UIView.animate(withDuration: 0.5, delay: 0.05 * Double(indexPath.row), animations: {
//        //           cell.transform = CGAffineTransform(rotationAngle: 0.0)
//        //        })
//
//        //        cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: 0)
//        //        UIView.animate(withDuration: 4, delay: 0.05 * Double(indexPath.row), usingSpringWithDamping: 0.4, initialSpringVelocity: 0.1, options: .curveEaseIn, animations: {
//        //              cell.transform = CGAffineTransform(translationX: cell.contentView.frame.width, y: cell.contentView.frame.height)
//        //        })
//
//        cell.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//        UIView.animate(withDuration: 0.4) {
//            cell.transform = CGAffineTransform.identity
//        }
//
//
//    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

