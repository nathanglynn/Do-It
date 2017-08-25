//
//  TasksViewController.swift
//  Do It
//
//  Created by Nathan Glynn on 8/25/17.
//  Copyright © 2017 Nathan Glynn. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // outlet added from UI
    @IBOutlet weak var tableView: UITableView!
    
    // create a variable that is an array of task objects
    var tasks : [Task] = []
    var selectedIndex = 0
    
    //pre-existing view controller function
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // set value of tasks variable to the output of the makeTasks function below, it is in this part of the code because the tasks variable needs to have some content before the dataSource and delegate code is run
        tasks = makeTasks()
        
        //look to the enclosing class for the delegate and the datasource
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // function for how many rows
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // count the number of rows in the tasks array and use that for the number of rows
        return tasks.count
    }
    // function for what goes in a cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // set a value for the 'selectedIndex' variable for each row so the position can be passed to other functions (for deleting an entry)
        selectedIndex = indexPath.row
        //create a constant called "cell" that is of the table view cell class
        let cell = UITableViewCell()
        // create a constant for each task object in the array to use for content in the cells
        let task = tasks[indexPath.row]
        // if/else for whether "important = true"
        if task.important {
            cell.textLabel?.text = "😮\(task.name)"
        } else {
            // just set the text label for the cell constants to be the name of the task constants
            cell.textLabel?.text = task.name
        }
        
        //use the cell constants as the output of the function
        return cell
    }
    
    // function for what happens when a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // create a constant for the selected row
        let task = tasks[indexPath.row]
        // perform this segue (the one to switch to the detail view) when the row is selected (sender: the task constant defined above)
        performSegue(withIdentifier: "selectTaskSegue", sender: task)
    }
    
    // function for creating tasks, creates an array of objects using the "Task" class [Task]
    func makeTasks(/* no parameters */) -> [Task] {
        let task1 = Task()
        task1.name = "walk the dog"
        task1.important = true
        
        let task2 = Task()
        task2.name = "do the thing"
        task2.important = false
        
        let task3 = Task()
        task3.name = "ship the package"
        task3.important = false
        
        return[task1,task2,task3]
    }
    @IBAction func plusTapped(_ sender: Any) {
        performSegue(withIdentifier:  "addSegue", sender: nil)
    }
    // function to say, "before we segue to a new view controller for creating or editing tasks set this current view controller as the "previousVC" so we know where to return to
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //if/else to define behavior for each seque
        if segue.identifier == "addSegue" {
            // set "nextVC" constant to have a segue destination using our create task view controller
            let nextVC = segue.destination as! CreateTaskViewController
            // send the current view controller as the nextVC.previousVC property
            nextVC.previousVC = self
        }
        if segue.identifier == "selectTaskSegue" {
            let nextVC = segue.destination as! CompleteTaskViewController
            //send the current selected task as the task to be used in the detail view
            nextVC.task = sender as! Task
            nextVC.previousVC = self
        }
    }
}

