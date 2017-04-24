//
//  AlarmViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 02/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit
import UserNotifications

class AlarmViewController: UIViewController {

    
    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var alarmLabel: UILabel!
    @IBOutlet weak var logButton: UIButton!
    var ref : FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Pacifico", size: 25)!]
        self.backBarButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        
        self.logButton.layer.cornerRadius = 5;
        
        ref = FIRDatabase.database().reference()
        ref.child("intrusions").queryLimited(toLast: 1).observe(.value, with: { (snapshot) in
            if snapshot.exists() {
                print(snapshot)
                let intrusion = Intrusion()
                let result = snapshot.children.allObjects as? [FIRDataSnapshot]
                let idLast = result?[0].key
                intrusion.date = snapshot.childSnapshot(forPath: "\(idLast!)/date").value! as! String
                intrusion.time = snapshot.childSnapshot(forPath: "\(idLast!)/time").value! as! String
                intrusion.key = idLast!
                intrusion.device = snapshot.childSnapshot(forPath: "\(idLast!)/device").value! as! String
                self.alarmLabel.text = intrusion.description()
            } else {
                self.alarmLabel.text = "No intrusion noticed by the watchkeeper !"
            }
        })
    }

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }

    
    
    /* Helper function to create an intrusion
    func create() {
        ref = FIRDatabase.database().reference()
        let key = ref.child("intrusions").childByAutoId().key
        let currentDate = NSDate()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let convertedTime = dateFormatter.string(from: currentDate as Date)
        dateFormatter.dateFormat = "dd/MM/YYYY"
        let convertedDate = dateFormatter.string(from: currentDate as Date)
        let post = ["date" : convertedDate,
                    "time" : convertedTime,
                    "device" : "I001"]
        let childUpdates = ["/intrusions/\(key)": post]
        ref.updateChildValues(childUpdates)

    } */
}
