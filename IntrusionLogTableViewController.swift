//
//  IntrusionLogTableViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 24/04/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class IntrusionLogTableViewController: UITableViewController {

    
    var intrusions = [Intrusion]()
    var ref : FIRDatabaseReference!
    
    @IBOutlet weak var eraseBarButton: UIBarButtonItem!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Pacifico", size: 25)!]
        self.backButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        self.eraseBarButton.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        ref = FIRDatabase.database().reference()
        ref.child("intrusions").observe(FIRDataEventType.value, with: { (snapshot) in
            if snapshot.childrenCount > 0 {
                self.intrusions.removeAll()
                print(snapshot)
                for child in snapshot.children.allObjects as! [FIRDataSnapshot]{
                    let intrusionItem = child.value as! [String: AnyObject]
                    let intrusion = Intrusion()
                    intrusion.date = intrusionItem["date"] as! String
                    intrusion.device = intrusionItem["device"] as! String
                    intrusion.time = intrusionItem["time"] as! String
                    self.intrusions.append(intrusion)
                }
            }
            self.tableView.reloadData()
        })
    }

    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return intrusions.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "intrusionCell", for: indexPath) as! IntrusionTableViewCell

        cell.dateLabel.text = intrusions[indexPath.row].date
        cell.timeLabel.text = intrusions[indexPath.row].time
        cell.deviceLabel.text = intrusions[indexPath.row].device
        return cell
    }
    
    @IBAction func eraseButton(_ sender: UIBarButtonItem) {
        ref = FIRDatabase.database().reference()
        ref.child("intrusions").removeValue()
        self.intrusions = []
        self.tableView.reloadData()
        self.dismiss(animated: true, completion: nil)
    }

 

}
