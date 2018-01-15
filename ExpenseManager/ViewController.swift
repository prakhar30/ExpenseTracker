//
//  ViewController.swift
//  ExpenseManager
//
//  Created by Prakhar Tripathi on 29/04/17.
//  Copyright © 2017 Prakhar Tripathi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myBalance: UILabel!
    @IBOutlet weak var parentsBalance: UILabel!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView1: UITableView!
    var myMoney:[Int] = []
    var parentsMoney:[Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UserDefaults.standard.value(forKey: "account1") != nil {
            parentsMoney = UserDefaults.standard.value(forKey: "account1")! as! [Int]
        }
        if UserDefaults.standard.value(forKey: "account2") != nil {
            myMoney = UserDefaults.standard.value(forKey: "account2")! as! [Int]
        }

        mybal()
        parentBal()
    }
    
    @IBAction func addParentsButton(_ sender: Any) {
        alertOne()
    }
    
    @IBAction func addMineButton(_ sender: Any) {
        alertTwo()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1){
            return parentsMoney.count
        }
        if(tableView.tag == 2){
            return myMoney.count
        }
        return 1
    }
    
    func mybal(){
        let sum = myMoney.reduce(0, +)
        myBalance.text = "\(sum)"
    }
    
    func parentBal(){
        let sum = parentsMoney.reduce(0, +)
        parentsBalance.text = "\(sum)"
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell:TableViewCell = self.tableView1.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        if(tableView.tag == 1){
            cell.moneyLabel.text = "\(parentsMoney[indexPath.row])"
            if(parentsMoney[indexPath.row] < 0){
                cell.backgroundColor = UIColor.red
            }else{
                cell.backgroundColor = UIColor.green
            }
        }
        if(tableView.tag == 2){
            cell.moneyLabel.text = "\(myMoney[indexPath.row])"
            if(myMoney[indexPath.row] < 0){
                cell.backgroundColor = UIColor.red
            }else{
                cell.backgroundColor = UIColor.green
            }
        }
        return cell
    }
    
    func alertOne(){
        let alert=UIAlertController(title: "New entry", message: "Enter an amount", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            let fields = alert.textFields!
            print(fields[0].text!)
            self.parentsMoney.append(Int(fields[0].text!)!)
            self.tableView1.reloadData()
            UserDefaults.standard.set(self.parentsMoney, forKey: "account1")
            self.parentBal()
        }))
        present(alert, animated: true, completion: nil)
    }
    
    func alertTwo(){
        let alert=UIAlertController(title: "New entry", message: "Enter an amount", preferredStyle: UIAlertControllerStyle.alert)
        alert.addTextField(configurationHandler: nil)
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Create", style: UIAlertActionStyle.default, handler: {(action:UIAlertAction) in
            let fields = alert.textFields!
            print(fields[0].text!)
            self.myMoney.append(Int(fields[0].text!)!)
            UserDefaults.standard.set(self.myMoney, forKey: "account2")
            self.tableView2.reloadData()
            self.mybal()
        }))
        present(alert, animated: true, completion: nil)
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

