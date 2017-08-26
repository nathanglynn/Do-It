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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addTapped(_ sender: Any) {
        // standard line of code to connect the database stuff defined in AppDelegate.swift to our 'dbcontext' variable
        let dbcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //create a task from the outlets' information
        // make a task constant using the task entity defined in the db
        let task = Task(context: dbcontext)
        // use the text input in the text field as the task.name
        task.name = taskNameTextField.text!
        // set whether it is important or not, if it "isOn" then it's important, if it's not "isOn" then it won't be marked as important
        task.important = importantSwitch.isOn
        // use the saveContext function defined in AppDelegate to save the record to the database
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        // tell the nav controller to move back to the previous controller
        navigationController!.popViewController(animated: true)
    }
    
    
}
