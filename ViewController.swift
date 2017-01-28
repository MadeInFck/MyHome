//
//  ViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 26/01/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        label.text = String(describing: FIRInstanceID.instanceID().token()!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

