//
//  TaskEntity.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation
import RealmSwift

class TaskEntity : Object{
    
    //Table Structure
    // id -> Str (Auto Generated)
    // title -> Str
    // description -> Str
    // isActive -> bool
    
    //Creating Table
    @Persisted(primaryKey: true) var _id:ObjectId //Generated GUID
    @Persisted var title:String = ""
    @Persisted var taskDescription:String = ""
    @Persisted var isActive:Bool = false
    
}
