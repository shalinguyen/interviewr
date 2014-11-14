//
//  JobDescriptionViewController.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class JobDescriptionViewController: UIViewController {

    var jobDescription: JobDescription!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var organizationLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        titleLabel.text = jobDescription.title
        organizationLabel.text = jobDescription.organization
        descriptionLabel.text = jobDescription.descriptionText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "editJobDescription") {
            (Util.nextViewController(segue) as JobDescriptionEditViewController).jobDescription = jobDescription
        }
    }
}
