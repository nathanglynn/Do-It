//
//  CompleteTaskViewController.swift
//  Do It
//
//  Created by Nathan Glynn on 8/25/17.
//  Copyright © 2017 Nathan Glynn. All rights reserved.
//

import UIKit

class CompleteTaskViewController: UIViewController {
    @IBOutlet weak var taskLabel: UILabel!
    
    // create a task variable so this view controller understand a task being sent to it from the segue
    var task = Task()
    // set a variable for what the previous view controller was
    var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        if task.important {
            taskLabel.text = "😮\(task.name)"
        } else {
            // just set the text label for the cell constants to be the name of the task constants
            taskLabel.text = task.name
        }
        
        
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // removes the selected task
        previousVC.tasks.remove(at: previousVC.selectedIndex)
        // tell the tableview in the previous view controller to reload its data
        previousVC.tableView.reloadData()
        // tell the nav controller to move back to the previous controller
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
}
