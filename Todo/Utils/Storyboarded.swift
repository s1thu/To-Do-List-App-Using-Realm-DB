//
//  Storyboarded.swift
//  Todo
//
//  Created by Phyo Thiha on 5/26/24.
//

import Foundation
import UIKit

protocol StoryBoarded {
    static var storyboardName: String {get set}
    //LoginVC.ininstantiate() -> LoginVC
    static func ininstantiate(bundle: Bundle) -> Self
}

extension StoryBoarded where Self:UIViewController{
    static func ininstantiate(bundle: Bundle = Bundle.main) -> Self {
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: bundle)
        //LoginVC.self => "LoginVC"
       return storyboard.instantiateViewController(withIdentifier: String(describing: Self.self)) as! Self
    }
}
