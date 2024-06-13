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
    
    var id:String? = nil{
        didSet{
            vm.getTaskById(id: id)
        }
    }
    
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
        onChangeData()
    }
    
    @objc func onChangeDescription(){
        onChangeTaskName()
    }
    
    func onChangeData(){
        vm.setTaskName(taskName: tfTaskName.text)
        vm.setTaskDesc(taskDesc: tfDesc.text)
    }
    
    @objc func onTapUpdate() {
        vm.updateTask(id: (data?.id)!)
    }
    
    @objc func onTapDelete() {
        vm.deleteTask(id:(data?.id)!)
    }
    
}
extension UpdateTodoVC: UpdateToDoVMDelegate{
    func onSuccessGetTask(data: TaskVO) {
        self.data = data
    }
    
    func onUpdateSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func onError(error: String) {
        print(error)
    }
    
    func onDeleteSuccess() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func onValidate(passed: Bool) {
        btnUpdate.isEnabled = passed
    }
    
    
}
