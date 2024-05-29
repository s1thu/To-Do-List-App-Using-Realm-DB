//
//  AddTodoVC.swift
//  Todo
//
//  Created by Phyo Thiha on 5/26/24.
//

import UIKit

class AddTodoVC: UIViewController, StoryBoarded {
    
    static var storyboardName: String = "Main"
    
    var btnSave: UIBarButtonItem? = nil
    
    @IBOutlet weak var tfTaskName: UITextField!
    @IBOutlet weak var tfTaskDescription: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Task"
        
        btnSave = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onTapSave))
        btnSave?.tintColor = .black
        btnSave?.isEnabled = false
        self.navigationItem.rightBarButtonItem = btnSave
        
        
    }
    
    @objc func onTapSave() {
        
    }
    
}
