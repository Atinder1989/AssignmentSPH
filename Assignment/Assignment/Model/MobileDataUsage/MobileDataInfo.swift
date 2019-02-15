//
//  MobileDataInfo.swift
//  Assignment
//
//  Created by Atinderpal Singh on 05/02/19.
//  Copyright © 2019 Abc. All rights reserved.
//

import Foundation

struct MobileDataInfo {
    var year: String
    var quarters: [Float]
    
    func isVolumeDataDecrease()-> Bool {
        var isVolumeDecrease = false
        var previousValue:Float = 0.0
        let _ = self.quarters.map { (currenValue)  in
            if currenValue < previousValue {
                isVolumeDecrease = true
            }else {
                previousValue = currenValue
            }
        }
        return isVolumeDecrease
    }
    
    func getTotalDataConsumption() -> Float {
        var total:Float = 0.0
        let _ = self.quarters.map { (value) in
            total = total + value
        }
        return total
    }
}
