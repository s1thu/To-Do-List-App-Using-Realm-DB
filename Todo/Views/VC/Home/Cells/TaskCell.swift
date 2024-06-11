//
//  TaskCell.swift
//  Todo
//
//  Created by Phyo Thiha on 5/26/24.
//

import UIKit

class TaskCell: UITableViewCell {

    @IBOutlet weak var lblTaskName: UILabel!
    @IBOutlet weak var lblDesc: UILabel!
    
    var data:TaskVO? = nil {
        didSet{
            if let data = data{
                lblTaskName.text = data.title
                lblDesc.text = data.taskDescription
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
//    func bindData(data:TaskVO){
//        lblTaskName.text = data.title
//        lblDesc.text = data.taskDescription
//    }
    
}
