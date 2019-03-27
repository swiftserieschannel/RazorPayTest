//
//  ViewController.swift
//  RazorPayTest
//
//  Created by chander bhushan on 24/03/19.
//  Copyright © 2019 Educational. All rights reserved.
//

import UIKit
import Razorpay


class ViewController: UIViewController {

    //MARK: - INSTANCE VARIABLES
    private var razorpay:Razorpay?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        razorpay = Razorpay.initWithKey("rzp_test_FYCQAsmKTFF8FR", andDelegate: self)
    }


    @IBAction func payNowClicked(_ sender: Any) {
        
        let options: [String:Any] = [
            "amount" : "1000", //mandatory in paise like:- 1000 paise ==  10 rs
            "description": "purchase description",
            "image": "ss",
            "name": "Swift Series",
            "prefill": [
            "contact": "9797979797",
            "email": "foo@bar.com"
            ],
            "theme": [
                "color": "#F37254"
            ]
        ]
       razorpay?.open(options)
    }
}

extension ViewController: RazorpayPaymentCompletionProtocol {
    func onPaymentSuccess(_ payment_id: String) {
        let alert = UIAlertController(title: "Paid", message: "Payment Success", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func onPaymentError(_ code: Int32, description str: String) {
        let alert = UIAlertController(title: "Error", message: "\(code)\n\(str)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
