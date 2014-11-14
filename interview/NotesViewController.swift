//
//  NotesViewController.swift
//  interview
//
//  Created by Bryan Pon on 11/13/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var interview: Interview!
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        ParseClient.getNotesByInterview(interview) {(notes: [Note]) -> () in
            self.notes = notes
            self.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let note = notes[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("NotesCell") as NotesCell
        cell.dateCreatedLabel.text = Util.formatDateNormal(note.dateCreated)
        cell.titleLabel.text = note.content
        cell.createdByLabel.text = note.createdBy.name
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notes.count
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "newNote") {
            let vc = (segue.destinationViewController as UINavigationController).childViewControllers[0] as NoteEditViewController
            vc.interview = interview
        }
    }
}
