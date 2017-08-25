//
//  CreateTaskViewController.swift
//  Do It
//
//  Created by Nathan Glynn on 8/25/17.
//  Copyright © 2017 Nathan Glynn. All rights reserved.
//

import UIKit

class CreateTaskViewController: UIViewController {

    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var taskNameTextField: UITextField!
    
    // set a variable for what the previous view controller was
     var previousVC = TasksViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addTapped(_ sender: Any) {
    //create a task from the outlets' information
        // make a task constant using the task class
        let task = Task()
        // use the text input in the text field as the task.name
        task.name = taskNameTextField.text!
        // set whether it is important or not, if it "isOn" then it's important, if it's not "isOn" then it won't be marked as important
        task.important = importantSwitch.isOn
        // add new task to array in previous viewController
        previousVC.tasks.append(task)
        // tell the tableview in the previous view controller to reload its data
        previousVC.tableView.reloadData()
        // tell the nav controller to move back to the previous controller
        navigationController!.popViewController(animated: true)
    }


}
