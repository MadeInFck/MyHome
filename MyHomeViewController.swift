//
//  MyHomeViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 02/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class MyHomeViewController: UIViewController {

    @IBOutlet weak var myHomeLabel: UILabel!
    @IBOutlet weak var WxButton: UIButton!
    @IBOutlet weak var AlarmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        myHomeLabel.clipsToBounds = true
        myHomeLabel.layer.cornerRadius = 20
        
        WxButton.layer.shadowOffset.height = 5
        WxButton.layer.shadowOffset.width = 5
        WxButton.layer.shadowRadius = 10
        WxButton.layer.shadowColor = UIColor.black.cgColor
        WxButton.layer.shadowOpacity = 1

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
