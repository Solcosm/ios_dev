//
//  ViewController.swift
//  Control Fun Kettering
//
//  Created by Michael Kettering on 1/16/18.
//  Copyright © 2018 Me. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIActionSheetDelegate {
    
    //Text Fields
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var numberField: UITextField!
    
    //Slider
    
    @IBOutlet weak var sliderLabel: UILabel!
    @IBAction func sliderChanged(_ sender: UISlider) {
        sliderLabel.text = String(Int(sender.value))
    }
    
    //Segmented Control
    
    @IBAction func toggleControls(_ sender: UISegmentedControl) {
        if (sender.selectedSegmentIndex == 0) {
            self.leftSwitch.isHidden = false;
            self.rightSwitch.isHidden = false;
            self.doSomethingButton.isHidden = true;
        }
        else {
            self.leftSwitch.isHidden = true;
            self.rightSwitch.isHidden = true;
            self.doSomethingButton.isHidden = false;
        }
    }
    
    //Switches
    
    @IBOutlet weak var leftSwitch: UISwitch!
    @IBOutlet weak var rightSwitch: UISwitch!
    @IBAction func switchChanged(_ sender: UISwitch) {
        if (sender.isOn == true) {
            self.leftSwitch .setOn(true, animated: true)
            self.rightSwitch .setOn(true, animated: true)
        }
        else {
            self.leftSwitch .setOn(false, animated: true)
            self.rightSwitch .setOn(false, animated: true)
        }
    }
    
    //doSomething Button/Action Sheet
    @IBOutlet weak var doSomethingButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        
        //ActionSheet Alert (aka Alert1)
        let alert = UIAlertController(title: "Are you sure?",
                                      message: nil,
                                      preferredStyle: UIAlertControllerStyle.actionSheet)
        
        //Choice1 - Handler used to create nested alert
        alert.addAction(UIAlertAction(title: "Yes, I'm Sure!",
                                      style: UIAlertActionStyle.destructive,
                                      handler:
            { (action) in
                let alert2 = UIAlertController(title: "Something was done", message: "You can breathe easy, everything went OK.", preferredStyle: UIAlertControllerStyle.alert)
                alert2.addAction(UIAlertAction(title: "Phew!", style: UIAlertActionStyle.cancel, handler: nil))
                
                //Displays Nested Alert
                self.present(alert2, animated: true)
        }))
        
        //Choice2
        alert.addAction(UIAlertAction(title: "No Way!",
                                      style: UIAlertActionStyle.cancel,
                                      handler: nil))
        //Displays Alert
        self.present(alert, animated: true)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    //Hide keyboard when user touches outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    //Presses return key
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        return (true)
    }
}

