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
    var intrusions : [Intrusion] = []
    var ref : FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Pacifico", size: 25)!]
        self.backBarButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        ref = FIRDatabase.database().reference()
     
    }

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
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
