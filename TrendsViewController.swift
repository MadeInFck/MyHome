//
//  TrendsViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 02/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class TrendsViewController: UIViewController {

    @IBOutlet weak var backBarButtonItem: UIBarButtonItem!
    @IBOutlet weak var webViewUp: UIWebView!
    @IBOutlet weak var webViewDown: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backBarButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        
        let urlUpString = "<iframe width=\"270\" height=\"244\" style=\"border: 1px solid #cccccc;\" src=\"https://thingspeak.com/channels/72262/charts/1?days=1&type=line\"></iframe>"
        webViewUp.loadHTMLString(urlUpString, baseURL: nil)
        
        let urlDownString = "<iframe width=\"270\" height=\"244\" style=\"border: 1px solid #cccccc;\" src=\"https://thingspeak.com/channels/72262/charts/2?days=1&title=Pression+maison&type=line\"></iframe>"
        webViewDown.loadHTMLString(urlDownString, baseURL: nil)
    }

    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
