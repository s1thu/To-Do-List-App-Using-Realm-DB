//
//  AddTodoVM.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation

protocol AddTodoViewDelegate{
    func onSuccessAddTask()
    func onError(error:String)
    func onValidate(isValidationPassed:Bool)
}

class AddTodoVM{
    
    private let taskRepository = TaskRepository.init()
    
    private let delegate: AddTodoViewDelegate
    
    private var taskName:String? = nil{
        didSet{
            validate()
        }
    }
    
    private var taskDescription:String? = nil{
        didSet{
            validate()
        }
    }
    
    init(delegate: AddTodoViewDelegate) {
        self.delegate = delegate
    }
    
    func setTaskName(with taskName:String?){
        self.taskName = taskName
    }
    
    func setTaskDescription(with taskDescription:String?){
        self.taskDescription = taskDescription
    }
    
    private func validate(){
        if let taskName = taskName,!taskName.isEmpty, let taskDescription = taskDescription, !taskDescription.isEmpty{
            delegate.onValidate(isValidationPassed: true)
        }else{
            delegate.onValidate(isValidationPassed: false)
        }
    }
    
    func addTask(){
        taskRepository
            .addTask(with: taskName!,
                     and: taskDescription!) {
                self.delegate.onSuccessAddTask()
            } onFailed: { error in
                self.delegate.onError(error: error)
            }

    }
}

