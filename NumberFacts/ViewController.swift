//
//  ViewController.swift
//  NumberFacts
//
//  Created by Abinaya Sindhu on 20/12/17.
//  Copyright © 2017 Abinaya Sindhu. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var whatNumber: UILabel!
    @IBOutlet weak var curious: UILabel!
    @IBOutlet weak var enterNumber: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    let URL = "http://numbersapi.com/"
    var final_url = ""
    var factJSON : JSON?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        containerView.addGestureRecognizer(tapGesture)

    }
   
    @objc func viewTapped() {
        enterNumber.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //enterNumber.endEditing(true)
    @IBAction func searchPressed(_ sender: UIButton) {
        if enterNumber.text == "" {
           errorLabel.text = "Please Enter a Valid Number"
        } else {
            final_url = URL + enterNumber.text! + "?json"
            sender.setTitle("SEARCHING", for: UIControlState.normal)
            getData(url: final_url)
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFacts" {
            let destinationVC = segue.destination as! SecondViewController
            if self.factJSON!["found"] == true {
                destinationVC.textPassedOver = self.factJSON!["text"].string
            } else {
                destinationVC.textPassedOver = "We do not have any facts for this number. Try another one!"
            }
        }
    }
    
    
    func getData(url: String) {
        Alamofire.request(url, method: .get)
            .responseJSON { response in
            if response.result.isSuccess {
                self.factJSON = JSON(response.result.value!)
                self.performSegue(withIdentifier: "showFacts", sender: self)
                } else {
                    print("Error: \(String(describing: response.result.error))")
         
            }
        }
    }
    
    
    
    
}

