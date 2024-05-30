//
//  HomeVM.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation

protocol HomeViewDelegate{
    func onGetTasks()
}

class HomeVM{
    
    private let taskRepository = TaskRepository.init()
    
    private let delegate : HomeViewDelegate
    
    init(delegate: HomeViewDelegate) {
        self.delegate = delegate
    }
    
    private (set) var tasks:[TaskVO] = []
    
    func getAllTasks(){
        taskRepository.getAllTask { task in
            self.tasks = task
        }
    }
}
