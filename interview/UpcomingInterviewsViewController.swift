//
//  UpcomingInterviewsViewController.swift
//  interview
//
//  Created by Bryan Pon on 11/14/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class UpcomingInterviewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var interviews: [Interview] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        ParseClient.getUpcomingInterviews {(interviews: [Interview]) -> () in
            self.interviews = interviews
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let interview = interviews[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("InterviewCell") as InterviewCell
        cell.dateLabel.text = Util.formatDateNormal(interview.startDate)
        cell.candidateNameLabel.text = interview.intervieweeName
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interviews.count
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
