//
//  ViewController.swift
//  Forming
//
//  Created by Cesar Devers on 12/10/14.
//  Copyright (c) 2014 Cesar Devers. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, ValidationFieldDelegate {

    @IBOutlet weak var emailTextInput: UITextField!
    @IBOutlet weak var phoneTextInput: UITextField!
    
    let Fields =  ["Email", "Phone"]
    let validator = Validator()

    override func viewDidLoad() {
        super.viewDidLoad()
        emailTextInput.delegate = self
        phoneTextInput.delegate = self
        validator.registerFieldByKey(Fields[0], textField: emailTextInput, rules: [.Required, .Email])
        validator.registerFieldByKey(Fields[1], textField: phoneTextInput, rules: [.Required, .PhoneNumber])
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func validationFieldFailed(key:String, error:ValidationError) {
        //set error text field to red
        error.textField.backgroundColor = UIColor.redColor()
    }
    
    func validationFieldSuccess(key:String, validField:UITextField) {
        //set valid text field to green
        validField.backgroundColor = UIColor.greenColor()
    }

    @IBAction func submitTapped(sender: AnyObject) {
        validator.validateFieldByKey(Fields[0], delegate:self)
        validator.validateFieldByKey(Fields[1], delegate:self)
    }
    
    @IBAction func validateField(sender: AnyObject) {
        switch (sender as UITextField) {
        case emailTextInput :
            validator.validateFieldByKey((Fields[0]), delegate: self)
            println("Validating email...", sender)
        case phoneTextInput :
            validator.validateFieldByKey((Fields[1]), delegate: self)
            println("Validating phone...", sender)
        default :
            println("no fields to validate")
        }
    }
}

