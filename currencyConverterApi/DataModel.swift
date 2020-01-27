//
//  DataModel.swift
//  currencyConverterApi
//
//  Created by Macbook on 27/01/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import Foundation





struct Currency : Codable{
    
   let success: Bool
   let timestamp: Int
   let base, date: String
   let rates: [String: Double]
}
