//
//  ViewController.swift
//  DoIt
//
//  Created by Jacques Labonte on 2021-01-18.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tblDoit: UITableView!
    
    var tasks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tasks = fillTaskArray()
        
        tblDoit.dataSource = self
        tblDoit.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let task = tasks[indexPath.row]
        
        if task.important{
            cell.textLabel?.text = "❗️ \(task.name)"
        } else {
            cell.textLabel?.text = task.name
        }
        
        return cell
    }

    func fillTaskArray() ->[Task] {
        
        let t1 = Task()
        t1.name = "Get haircut"
        t1.important = true
        
        let t2 = Task()
        t2.name = "Get grocery"
        t2.important = false
        
        let t3 = Task()
        t3.name = "Walk the dog"
        t3.important = true
        
        return [t1, t2, t3] 
    }
    
    
    @IBAction func addPushed(_ sender: Any) {
        performSegue(withIdentifier: "addSegue", sender: nil)
    }
}

