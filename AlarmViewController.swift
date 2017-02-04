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

    
    @IBOutlet weak var alarmLabel: UILabel!
    var intrusions : [Intrusion] = []
    var ref : FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()

        ref = FIRDatabase.database().reference()
        self.ref.child("intrusions").observe(.childAdded) { (snapshot:FIRDataSnapshot) in
            let intrusion = Intrusion()
            intrusion.key = snapshot.key
            print(intrusion.key)
            let value = snapshot.value as? NSDictionary
            intrusion.date  = (value!["date"] as? String)!
            self.intrusions.append(intrusion)
            
        }
        print(self.intrusions.description)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
