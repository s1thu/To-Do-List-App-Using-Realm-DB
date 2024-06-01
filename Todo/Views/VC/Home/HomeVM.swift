//
//  HomeVM.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation

protocol HomeViewDelegate{
    func onGetTasks()
    func onError(error:String)
    
}

class HomeVM{
    
    private let taskRepository = TaskRepository.init()
    
    private let delegate : HomeViewDelegate
    
    init(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    private (set) var tasks:[TaskVO] = []{
        didSet{
            self.delegate.onGetTasks()
        }
    }
    
    func getAllTasks(){
//        taskRepository.getAllTask { task in
//            self.tasks = task
//        }
        taskRepository.getAllTask { tasks in
            self.tasks = tasks
        } onFailed: { error in
            self.delegate.onError(error: error)
        }

    }
}
