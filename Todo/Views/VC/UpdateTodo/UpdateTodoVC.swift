//
//  UpdateTodoVC.swift
//  Todo
//
//  Created by Phyo Thiha on 5/26/24.
//

import UIKit

class UpdateTodoVC: UIViewController,StoryBoarded {
    
    static var storyboardName: String = "Main"
    @IBOutlet weak var tfTaskName: UITextField!
    @IBOutlet weak var tfDesc: UITextField!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var btnDelete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Update Task"
        
        btnUpdate.addTarget(self, action: #selector(onTapUpdate), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(onTapDelete), for: .touchUpInside)
    }
    
    @objc func onTapUpdate() {
        
    }
    
    @objc func onTapDelete() {
        
    }
    
}
