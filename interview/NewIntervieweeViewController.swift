//
//  NewIntervieweeViewController.swift
//  interview
//
//  Created by Dylan Harrington on 11/14/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class NewIntervieweeViewController: UIViewController {
    
    @IBOutlet weak var interviewTimeDatePicker: UIDatePicker!
    @IBOutlet weak var interviewTimeLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func interviewTimeDatePickerValueChanged(sender: UIDatePicker) {
        interviewTimeLabel.text = sender.date.description
    }

    @IBAction func interviewTimeEditingChanged(sender: UITextField) {
        if sender.editing {
            interviewTimeDatePicker.hidden = false
        } else {
            interviewTimeDatePicker.hidden = true
        }
    }
}
