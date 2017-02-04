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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        myHomeLabel.clipsToBounds = true
        myHomeLabel.layer.cornerRadius = 20

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
