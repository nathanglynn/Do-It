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
    
    // create a task variable so this view controller understands what a task is since we sent one with the segue, this is creating a a Task optional using the coredata date model for the task and setting it be nil by default, the info from the segue will over write that
    var task : Task? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        if task!.important {
            taskLabel.text = "😮\(task!.name!)"
        } else {
            // just set the text label for the cell constants to be the name of the task constants
            taskLabel.text = task!.name
        }
        
    }
    
    @IBAction func completeTapped(_ sender: Any) {
        // set the database context
        let dbcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        // delete the current record
        dbcontext.delete(task!)
        //save the changes
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // tell the nav controller to move back to the previous controller
        navigationController!.popViewController(animated: true)
    }
    
    
    
    
}
