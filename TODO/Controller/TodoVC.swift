//
//  ViewController.swift
//  TODO
//
//  Created by Алексей Шумейко on 23.06.2020.
//  Copyright © 2020 Алексей Шумейко. All rights reserved.
//

import UIKit

class TodoVC: UIViewController {

    @IBOutlet weak var todoItemTxt: UITextField!
    @IBOutlet weak var prioritySegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.shared.getTodos()
    }

    @IBAction func addTodo(_ sender: Any) {
    }
    
}

