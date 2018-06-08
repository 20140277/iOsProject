//
//  customEntitiesMethods.swift
//  appIOSes5labTEST
//
//  Created by Guillaume Henique on 06/06/2018.
//  Copyright © 2018 SAP. All rights reserved.
//
import SAPOData
import Foundation
//import SAPFiori


class Utils {
    open static func fetchEntityCount(entity: EntitySet, entities: GWSAMPLEBASICEntities<OnlineODataProvider>)throws -> Int64 {
        let countQuery = DataQuery().from(entity).count()
        return try entities.executeQuery(countQuery).count()
    }
    
    static func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
