//
//  ViewController.swift
//  todolistApp
//
//  Created by Konstantin Nenadov on 9/29/18.
//  Copyright © 2018 com.Konstantin Nenadov. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask {
    
    var tasks: [Task] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        tasks.append(Task(name: "Nauci da igrash KANTER !!!"))
        tasks.append(Task(name: "Shiptari Smrde"))
        tasks.append(Task(name: "Proveri da li je Kolja zavrsio domaci."))
        tasks.append(Task(name: "Skuvaj caj"))
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
            
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        
       cell.taskNameLabel.text = tasks[indexPath.row].name
        
       tableView.deselectRow(at: indexPath, animated: true)
       return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        tasks.remove(at: indexPath.row)
        // let indexPaths = [indexPath]
        // tableView.deleteRows(at: indexPaths, with: .automatic)
        tableView.reloadData()
    }
    
    
    
    // func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    //    let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, sourceView, completionHandler) in
    //        print("index path of delete: \(indexPath)")
    //        completionHandler(true)
            
            
    //    }
        
    //    let swipeActionConfig = UISwipeActionsConfiguration(actions: [delete])
    //    swipeActionConfig.performsFirstActionWithFullSwipe = false
    //    return swipeActionConfig
   // }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
    }
    
    func  addTask(name: String) {
        tasks.append(Task(name: name))
        tableView.reloadData()
        
    }

}

class Task {
    var name = ""
    var checked = false
    
    convenience init(name: String) {
        self.init()
        self.name = name
    }
}

