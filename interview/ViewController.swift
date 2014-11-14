//
//  ViewController.swift
//  interview
//
//  Created by Shali Nguyen on 10/9/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, PFLogInViewControllerDelegate {

    @IBOutlet weak var positionLabel: UILabel!
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var photoView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var linksLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    
    var interview: Interview!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ParseClient.getNextInterview {interview in
            self.interview = interview
            self.positionLabel.text = interview.position
            self.topicLabel.text = interview.topic
            self.locationLabel.text = interview.location
            self.nameLabel.text = interview.intervieweeName
        }
        
        // TODO organize this and display it only when a
        // button is pressed
        var logInViewController = PFLogInViewController()
        logInViewController.delegate = self
        presentViewController(logInViewController, animated: true, completion: nil)
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        func nextViewController() -> AnyObject {
            return (segue.destinationViewController as UINavigationController).childViewControllers[0]
        }
        switch (segue.identifier) {
        case "notes":
            (nextViewController() as NotesViewController).interview = interview
        case "jobDescription":
            (nextViewController() as JobDescriptionViewController).jobDescription = interview.jobDescription
        default: break
        }
    }
}

