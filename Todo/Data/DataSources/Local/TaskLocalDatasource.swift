//
//  TaskLocalDatasource.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation
import RealmSwift

class TaskLocalDatasource{
    
    private let realm:Realm
    
    static let shared = TaskLocalDatasource.init()
    
    //For data streaming need Notification Token
    var realmChangeListner: NotificationToken?
    
    private init(){
        realm = try! Realm()
    }
    
    //Create Tasks
    // *** Write & Delete function in realm can throw errors
    // *** Entity should not be used in UILevel not safe ( weak point of realm )
    func addTask(for task:TaskVO ) throws{
        try realm.write {
            realm.add(task.toEntity(), update: .all)
            print(realm.objects(TaskEntity.self))
        }
    }
    
    //Get Tasks
    func getAllTasks() -> [TaskVO]{
        Array(realm.objects(TaskEntity.self)).map { TaskEntity in
            TaskEntity.toVO()
        }
    }
    
    //Get Tasks data Streaming
    func getAllTasksData(
    onSuccess:@escaping([TaskVO]) -> (),
    onFailed:@escaping(String) -> ()
    ){
        //Register Listener
        realmChangeListner = realm.objects(TaskEntity.self).observe{ (changes:RealmCollectionChange) in
            switch changes {
            case .initial(let taskResult):
                onSuccess(taskResult.map{$0.toVO()})
            case .update(let taskResult, _, _, _):
                onSuccess(taskResult.map{$0.toVO()})
            case .error(let error):
                onFailed(error.localizedDescription)
            }
        }
    }
    
    //Get Specific Task
    //When fetch with Id, ID can exist or not that's why add optional.
    //If Id is exist return VO. If not return nil
    func getTaskById(id:String) -> TaskVO? {
        
        guard let objectId = try? ObjectId(string: id) else { return nil }
        
        return realm
            .object(ofType: TaskEntity.self, forPrimaryKey: objectId)?.toVO()
    }
    
    //Soft Delete -> isActive Flag -> False
    func deleteTask(id:String) throws{
       let task = realm
            .object(ofType: TaskEntity.self, forPrimaryKey:try? ObjectId(string: id))
        if let task = task {
            try realm.write {
                //Update Query
                //that's why we use VO in UILevel
                task.isActive = false
            }
        }
    }
    
    //Update Task
    func updatTask(data:TaskVO) throws{
       let task = realm
            .object(ofType: TaskEntity.self, forPrimaryKey:try? ObjectId(string: data.id!))
        if let task = task {
            try realm.write {
                //Update Query
                //that's why we use VO in UILevel

                task.title = data.title
                task.taskDescription = data.taskDescription
            }
        }
    }
}
