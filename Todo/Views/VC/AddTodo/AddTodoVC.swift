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
    
    lazy var vm = AddTodoVM.init(delegate: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add New Task"
        
        btnSave = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(onTapSave))
        btnSave?.tintColor = .black
        btnSave?.isEnabled = false
        self.navigationItem.rightBarButtonItem = btnSave
        
        tfTaskName.addTarget(self, action: #selector(onTaskNameChanged), for: .editingChanged)
        tfTaskDescription.addTarget(self, action: #selector(onTaskDescriptionChanged), for: .editingChanged)
        
    }
    
    @objc func onTaskNameChanged(){
        vm.setTaskName(with: tfTaskName.text)
    }
    
    @objc func onTaskDescriptionChanged(){
        vm.setTaskDescription(with: tfTaskDescription.text)
    }
    
    @objc func onTapSave() {
        vm.addTask()
    }
    
}

extension AddTodoVC:AddTodoViewDelegate{
    func onSuccessAddTask() {
        dismiss(animated: true)
    }
    
    func onError(error: String) {
        print(error)
    }
    
    func onValidate(isValidationPassed: Bool) {
        btnSave?.isEnabled = isValidationPassed
    }
    
    
}
