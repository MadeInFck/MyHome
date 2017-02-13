//
//  viewTemperature.swift
//  MyHome
//
//  Created by Mickael Fonck on 08/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import UIKit

@IBDesignable
class viewTemperature: UIView {

    override func draw(_ rect: CGRect) {
        //// Color Declarations
        let color = UIColor(red: 0.230, green: 0.697, blue: 0.863, alpha: 1.000)
        
        //// Rectangle Drawing
        let rectanglePath = UIBezierPath(roundedRect: CGRect(x:0, y:16, width:240, height:90), cornerRadius: 37)
        color.setFill()
        rectanglePath.fill()
    }


}
