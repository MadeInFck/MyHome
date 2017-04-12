//
//  weatherViewController.swift
//  MyHome
//
//  Created by Mickael Fonck on 02/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var backButtonItem: UIBarButtonItem!
    @IBOutlet weak var trendsBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var nextDayLabel: UILabel!
    @IBOutlet weak var imageViewNextDay: UIImageView!
    @IBOutlet weak var imageViewDay: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getWx(location: "Geloux, France")
        getHomeData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.titleTextAttributes = [NSFontAttributeName : UIFont(name: "Pacifico", size: 25)!]
        self.trendsBarButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        self.backButtonItem.setTitleTextAttributes([NSFontAttributeName : UIFont(name: "Pacifico", size: 15)!], for: UIControlState())
        //getWx(location: "Geloux, France")
    }
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateView(condition: String) {
            if condition.range(of:"partly cloudy") != nil {
                imageViewDay.image = UIImage(named: "clouds-and-sun.png")
            } else if condition.range(of:"sunny") != nil {
                imageViewDay.image = UIImage(named: "sunny.png")
            } else if condition.range(of: "cloudy") != nil {
                imageViewDay.image = UIImage(named: "cloudy.png")
            } else if condition == "snowy" {
                imageViewDay.image = UIImage(named: "snow.png")
            } else if condition == "rain" {
                imageViewDay.image = UIImage(named: "umbrellas.png")
            } else if condition == "showers" {
                imageViewDay.image = UIImage(named: "umbrellas.png")
            } else if condition.range(of: "scattered showers") != nil {
                imageViewDay.image = UIImage(named: "morning-rain.png")
            } else if condition.range(of:"clear") != nil {
                imageViewDay.image = UIImage(named: "sunny.png")
            } else if condition.range(of:"storm") != nil {
                imageViewDay.image = UIImage(named: "storm.png")
            }
        self.dayLabel.text = condition

    }
    
    func updateView1(condition: String) {
        if condition.range(of:"partly cloudy") != nil {
            imageViewNextDay.image = UIImage(named: "clouds-and-sun.png")
        } else if condition.range(of:"sunny") != nil {
            imageViewNextDay.image = UIImage(named: "sunny.png")
        } else if condition.range(of: "cloudy") != nil {
            imageViewNextDay.image = UIImage(named: "cloudy.png")
        } else if condition == "snowy" {
            imageViewNextDay.image = UIImage(named: "snow.png")
        } else if condition == "rain" {
            imageViewNextDay.image = UIImage(named: "umbrellas.png")
        } else if condition == "showers" {
            imageViewNextDay.image = UIImage(named: "umbrellas.png")
        } else if condition.range(of: "scattered showers") != nil {
            imageViewNextDay.image = UIImage(named: "morning-rain.png")
        } else if condition.range(of:"clear") != nil {
            imageViewNextDay.image = UIImage(named: "sunny.png")
        } else if condition.range(of:"storm") != nil {
            imageViewNextDay.image = UIImage(named: "storm.png")
        }
        self.nextDayLabel.text = condition
    }
    
    func getWx(location: String) {
        DispatchQueue.main.async {
            
        }
        if let urlEncodedLocation = location.addingPercentEncoding(withAllowedCharacters: CharacterSet(charactersIn: "!*'();:@&=+$,/?%#[] \"").inverted) {
            let url = URL(string: "https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20weather.forecast%20where%20woeid%20in%20(select%20woeid%20from%20geo.places(1)%20where%20text%3D%22\(urlEncodedLocation)%22)&format=json&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys")
            URLSession.shared.dataTask(with: url!) { (data: Data?, response: URLResponse?, error: Error?) in
                self.activityIndicator.startAnimating()
                if error != nil {
                    print("Error : \(String(describing: error))")
                    self.activityIndicator.stopAnimating()
                } else {
                    let json = JSON(data: data!)
                    if let condition = json["query"]["results"]["channel"]["item"]["condition"]["text"].string?.lowercased() {
                        print(condition)
                        self.updateView(condition: condition)
                    }
                    if let condition = json["query"]["results"]["channel"]["item"]["forecast"][1]["text"].string?.lowercased() {
                        print(condition)
                        self.updateView1(condition: condition)
                    }
                    self.activityIndicator.stopAnimating()
                }
                }.resume()
        }
    }
    
    func getHomeData() {
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
    
}
