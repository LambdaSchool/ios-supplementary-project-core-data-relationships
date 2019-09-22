//
//  TaskDetailViewController.swift
//  Tasks
//
//  Created by Spencer Curtis on 9/16/19.
//  Copyright © 2019 Andrew R Madsen. All rights reserved.
//

import UIKit

class TaskDetailViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var notesTextView: UITextView!
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    
    var taskController: TaskController?
    var task: Task?
    var taskList: TaskList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateViews()
    }
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text,
            let notes = notesTextView.text,
            let taskList = taskList,
            !name.isEmpty else { return }
        
        // Using some information from the segmented control, get a TaskPriority to pass to the functions below.
        
        let index = prioritySegmentedControl.selectedSegmentIndex
        
        let priority = TaskPriority.allCases[index]
        
//        switch index {
//        case 0:
//            priority = .low
//        case 1:
//            priority = .normal
//        case 2:
//            priority = .high
//        case 3:
//            priority = .critical
//        default:
//            priority = .normal
//        }
        
        if let task = task {
            taskController?.updateTask(task: task, with: name, notes: notes, priority: priority)
        } else {
            taskController?.createTask(with: name, notes: notes, priority: priority, in: taskList)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    func updateViews() {
        
        title = task?.name ?? "Create Task"
        
        nameTextField.text = task?.name
        notesTextView.text = task?.notes
        
        if let priorityString = task?.priority,
            let priority = TaskPriority(rawValue: priorityString) {
            
            let index = TaskPriority.allCases.firstIndex(of: priority) ?? 0
            
            prioritySegmentedControl.selectedSegmentIndex = index
        }
    }
}
