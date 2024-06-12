//
//  TaskRepository.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation

class TaskRepository{
    private let taskLocalDatasource = TaskLocalDatasource.shared
    
    func addTask(
        with taskName:String,
        and taskDescription:String,
        onSuccess:@escaping() -> (),
        onFailed:@escaping(String) -> ()
    ){
        do {
            try taskLocalDatasource.addTask(for: .init(title: taskName,
                                                       taskDescription: taskDescription,
                                                       isActive: true))
            onSuccess()
        } catch  {
            onFailed(error.localizedDescription)
        }
        
    }
    
    //Realm can't raise error when Read() call
    func getAllTask(
        onSuccess:@escaping([TaskVO]) -> (),
        onFailed:@escaping(String) -> ()
    ){
//        let data = taskLocalDatasource.getAllTasks()
//        onSuccess(data)
        taskLocalDatasource.getAllTasksData(onSuccess: onSuccess, onFailed: onFailed)
        
    }
    
    func deleteTask(id:String,
                    onSuccess:@escaping () -> (),
                    onFailed:@escaping(String) -> ()
    ){
        do {
            try taskLocalDatasource.deleteTask(id: id)
            onSuccess()
        } catch  {
            onFailed(error.localizedDescription)
        }
        
    }
    
    func getTaskById(id:String,
                     onSuccess:@escaping (TaskVO) -> ()
                     
    ){
        if let data = taskLocalDatasource.getTaskById(id: id){
            onSuccess(data)
        }
    }
    
    func updateTask(main id:String,
        with taskName:String,
                    and taskDescription:String,
                    onSuccess:@escaping() -> (),
                    onFailed:@escaping(String) -> ())
    {
        do {
            try taskLocalDatasource.updatTask(data: .init(id: id, title: taskName, taskDescription: taskDescription, isActive: true))
            onSuccess()
        } catch  {
            onFailed(error.localizedDescription)
        }
        
        
    }
}
