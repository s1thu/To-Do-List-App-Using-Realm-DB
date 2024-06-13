//
//  UpdateToDoVM.swift
//  Todo
//
//  Created by Sithu Win on 10/06/2024.
//

import Foundation

protocol UpdateToDoVMDelegate{
    func onValidate(passed:Bool)
    func onDeleteSuccess()
    func onUpdateSuccess()
    func onError(error: String)
    func onSuccessGetTask(data:TaskVO)
}

class UpdateToDoVM{
    
    private let taskRepository = TaskRepository.init()
    
    private let delegate:UpdateToDoVMDelegate
    
    init(delegate: UpdateToDoVMDelegate) {
        self.delegate = delegate
    }
    
    private var taskName:String? = nil{
        didSet{
            self.validate()
        }
    }
    
    private var taskDescription:String? = nil{
        didSet{ 
            self.validate()
        }
    }
    
    func setTaskName(taskName:String?){
        self.taskName = taskName
    }
    
    func setTaskDesc(taskDesc:String?){
        self.taskDescription = taskDesc
    }
    
    func validate(){
        if let taskName = taskName,!taskName.isEmpty, let taskDescription = taskDescription, !taskDescription.isEmpty{
            delegate.onValidate(passed:  true)
        }else{
            delegate.onValidate(passed:  false)
        }
    }
    
    func deleteTask(id:String){
        taskRepository.deleteTask(id: id) { [weak self] in
            self?.delegate.onDeleteSuccess()
        } onFailed: { error in
            print(error)
        }

    }
    
    func updateTask(id:String){
        taskRepository.updateTask(main: id,with: taskName!, and: taskDescription!) { [weak self] in
            self?.delegate.onUpdateSuccess()
        } onFailed: { error in
            self.delegate.onError(error: error)
        }


    }
    
    func getTaskById(id:String?){
        taskRepository.getTaskById(id: id!) { data in
            self.delegate.onSuccessGetTask(data: data)
        }
    }
    
}
