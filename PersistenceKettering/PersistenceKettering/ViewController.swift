//
//  ViewController.swift
//  PersistenceKettering
//
//  Created by Michael Kettering on 2/13/18.
//  Copyright © 2018 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    //Hide Keyboard - Add UITextFieldDelegate!
    //Set outlets
    @IBOutlet weak var inputField01: UITextField!
    @IBOutlet weak var inputField02: UITextField!
    @IBOutlet weak var inputField03: UITextField!
    @IBOutlet weak var inputField04: UITextField!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var outputLabel01: UILabel!
    @IBAction func button(_ sender: Any) {
        UserDefaults.standard.set(inputField01.text, forKey: "fieldData01")
        UserDefaults.standard.set(inputField02.text, forKey: "fieldData02")
        UserDefaults.standard.set(inputField03.text, forKey: "fieldData03")
        UserDefaults.standard.set(inputField04.text, forKey: "fieldData04")
        statusLabel.text = "Status: Saved! Please refresh the app!"
    }
    //Secure data uh, persistently?
    override func viewDidAppear(_ animated: Bool) {
        if let a = UserDefaults.standard.object(forKey: "fieldData01") as? String
        {
            inputField01.text = a
        }
        if let b = UserDefaults.standard.object(forKey: "fieldData02") as? String
        {
            inputField02.text = b
        }
        if let c = UserDefaults.standard.object(forKey: "fieldData03") as? String
        {
            inputField03.text = c
        }
        if let d = UserDefaults.standard.object(forKey: "fieldData04") as? String
        {
            inputField04.text = d
        }
        //Welcome Msg
        outputLabel01.text = "Welcome, " + inputField01.text! + " " + inputField02.text! + " " + inputField03.text! + "."
        //Hide Keyboard
        self.inputField01.delegate = self
        self.inputField02.delegate = self
        self.inputField03.delegate = self
        self.inputField04.delegate = self
    }
    //Hide Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputField01.resignFirstResponder()
        inputField02.resignFirstResponder()
        inputField03.resignFirstResponder()
        inputField04.resignFirstResponder()
        return true
    }
}
