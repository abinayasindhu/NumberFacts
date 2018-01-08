//
//  SecondViewController.swift
//  NumberFacts
//
//  Created by Abinaya Sindhu on 20/12/17.
//  Copyright © 2017 Abinaya Sindhu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class SecondViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentText: UITextView!
    
    var textPassedOver : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contentText.text = textPassedOver!
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func backButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "backButton", sender: self)
    }
    
}
