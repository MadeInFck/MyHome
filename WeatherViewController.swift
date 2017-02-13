//
//  weatherViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 02/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    @IBOutlet weak var trendsBarButtonItem: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        let url=URL(string:"https://thingspeak.com/channels/72262/feed")
        do {
            let allDataLoad = try Data(contentsOf: url!)
            let allData = try JSONSerialization.jsonObject(with: allDataLoad, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let feedJSON = allData["feeds"] {
                let lastData = feedJSON.lastObject as! [String: AnyObject]
                print(lastData)
                    pressureLabel.text = (lastData["field2"] as! String) + " mBar"
                    tempLabel.text = (lastData["field1"] as! String) + "°C"
            }
        }
        catch {
            tempLabel.text = ""
            pressureLabel.text = ""
            let alert = UIAlertController(title: "Caution", message: "Unable to get data from Thingspeak. Please verify your connection", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default) { action in
                
            })
            self.present(alert, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Pacifico", size: 25)!]
        self.trendsBarButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        self.backButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
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
