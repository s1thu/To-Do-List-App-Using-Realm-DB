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
    
    lazy var vm = UpdateToDoVM.init(delegate: self)
    
    var data:TaskVO? = nil {
        didSet{
            if let data = data{
                DispatchQueue.main.async { [weak self] in
                    self?.tfTaskName.text = data.title
                    self?.tfDesc.text = data.taskDescription
                }
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Update Task"
        
        tfTaskName.addTarget(self, action: #selector(onChangeTaskName), for: .editingChanged)
        tfDesc.addTarget(self, action: #selector(onChangeDescription), for: .editingChanged)
        btnUpdate.addTarget(self, action: #selector(onTapUpdate), for: .touchUpInside)
        btnDelete.addTarget(self, action: #selector(onTapDelete), for: .touchUpInside)
        
    }
    
    @objc func onChangeTaskName(){
        vm.setTaskName(taskName: tfTaskName.text)
    }
    
    @objc func onChangeDescription(){
        vm.setTaskDesc(taskDesc: tfDesc.text)
    }
    
    @objc func onTapUpdate() {
        
    }
    
    @objc func onTapDelete() {
        vm.deleteTask(id: (data?.id)!)
//        vm.getTaskById(id: (data?.id)!)
    }
    
}
extension UpdateTodoVC: UpdateToDoVMDelegate{
    func onDeleteSuccess() {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func onValidate(passed: Bool) {
        btnUpdate.isEnabled = passed
    }
    
    
}
