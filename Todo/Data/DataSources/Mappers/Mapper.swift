//
//  Mapper.swift
//  Todo
//
//  Created by Sithu Win on 30/05/2024.
//

import Foundation


extension TaskVO{
    func toEntity() -> TaskEntity{
        let task = TaskEntity.init()
        task.title = self.title
        task.taskDescription = self.taskDescription
        task.isActive = self.isActive
        return task
    }
}

extension TaskEntity{
    func toVO() -> TaskVO {
        TaskVO.init(id: _id.stringValue,
                    title: self.title,
                    taskDescription: self.taskDescription,
                    isActive: self.isActive)
    }
}
