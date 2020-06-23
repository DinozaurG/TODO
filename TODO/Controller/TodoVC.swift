//
//  ViewController.swift
//  TODO
//
//  Created by Алексей Шумейко on 23.06.2020.
//  Copyright © 2020 Алексей Шумейко. All rights reserved.
//

import UIKit

class TodoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var todoItemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    @IBOutlet weak var todoTable: UITableView!
    
    var todos = Array<Todo>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoTable.delegate = self
        todoTable.dataSource = self
        getTodos()
    }
    
    func getTodos() {
        NetworkService.shared.getTodos(onSuccess: { (todos) in
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            
        }
    }
    
    @IBAction func addTodo(_ sender: Any) {
        guard let todoItem = todoItemTxt.text else {
            return
        }
        let todo = Todo(item: todoItem, priority: prioritySegment.selectedSegmentIndex)
        NetworkService.shared.addTodo(todo: todo, onSuccess: { (todos) in
            self.todoItemTxt.text = ""
            self.todos = todos.items
            self.todoTable.reloadData()
        }) { (errorMessage) in
            
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "TodoCell") as? TodoCell {
            cell.updateCell(todo: todos[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

