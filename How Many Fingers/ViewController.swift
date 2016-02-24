//
//  ViewController.swift
//  How Many Fingers
//
//  Created by voodoo15 on 2016-02-23.
//  Copyright © 2016 voodoo15. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lblResponse: UILabel!
    
    @IBOutlet var txtGuess: UITextField!
    
    @IBOutlet var imgResult: UIImageView!
    
    @IBAction func btnSubmit(sender: AnyObject) {
        
        //Randomize a number
        let iRandom = Int(arc4random_uniform(6))
        print(iRandom)
        
        //If the guess = random number, success
        //else display wrong number.  If number is > 5
        //tell them they're stupid.
        if iRandom == Int(txtGuess.text!) {
            imgResult.image = UIImage(named: "Salute_Finger.jpg")
            lblResponse.text = "Damnit, you're psychic!"
            print("Correct")
            }
        else if Int(txtGuess.text!) > 5 {
            imgResult.image = UIImage(named: "really.jpg")
            print("Too many fingers")
            lblResponse.text = "REALLY? Try again...idiot!"
            }
        else {
            imgResult.image = UIImage(named: "wrong.png")
            print("Wrong answer")
            lblResponse.text = "Nope, try again!"
            }
        
        txtGuess.text = ""
        dismissKeyboard()
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

