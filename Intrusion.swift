//
//  intrusionModel.swift
//  MyHome
//
//  Created by Mickael Fonck on 03/02/2017.
//  Copyright © 2017 Mickael Fonck. All rights reserved.
//

import Foundation

class Intrusion {
    var device = ""
    var date = ""
    var time = ""
    var key = ""

    func description()->String {
        return device + " detected motion on the " + date + " at " + time + "."
    }
}
