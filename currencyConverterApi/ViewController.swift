//
//  ViewController.swift
//  currencyConverterApi
//
//  Created by Macbook on 27/01/2020.
//  Copyright © 2020 Macbook. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var euroTf: UITextField!
    
    @IBOutlet weak var takaTf: UILabel!
    
    
    
    
    var mon : Double?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        let json = "http://data.fixer.io/api/latest?access_key=553e7954112c6b602341835caf5b2cf1&symbols=USD,BDT&format=1"
        
        
        guard let url = URL(string: json) else {
            return
        }
        
        
        var dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data else {return}
            
            
            do {
                
                let money = try JSONDecoder().decode(Currency.self, from: data)
                
                self.mon = money.rates["BDT"]
                
                print(money)
                print(money.rates["BDT"])
                
            }catch{
                print(error)
            }
        }
        
        dataTask.resume()
        
    }
    
    
    
    @IBAction func convertPressed(_ sender: Any) {
        
        
        if euroTf.text != nil{
            
            var euro = Double (euroTf.text!)
            
            let taka = mon
            
            let calculation = (euro!*taka!)
            
            takaTf.text = String(format: "%.2f", calculation)
            
        }
        
        
    }
    

}

