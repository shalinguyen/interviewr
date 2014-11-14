//
//  JobDescriptionEditViewController.swift
//  interview
//
//  Created by Bryan Pon on 11/14/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class JobDescriptionEditViewController: UIViewController {

    var jobDescription: JobDescription!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if (jobDescription != nil) {
            titleField.text = jobDescription.title
            descriptionField.text = jobDescription.descriptionText
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onTouchCancel(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onTouchSave(sender: AnyObject) {
        if (!titleField.text.isEmpty) {
            if (jobDescription != nil) {
                jobDescription.title = titleField.text
                jobDescription.descriptionText = descriptionField.text
            } else {
                jobDescription = JobDescription(title: titleField.text, descriptionText: descriptionField.text)
            }
            ParseClient.saveJobDescription(jobDescription) {
                self.dismissViewControllerAnimated(true, completion: nil)
            }
        }
    }
}
