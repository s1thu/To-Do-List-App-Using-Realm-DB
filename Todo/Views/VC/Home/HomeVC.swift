//
//  HomeVC.swift
//  Todo
//
//  Created by Phyo Thiha on 5/26/24.
//

import UIKit

class HomeVC: UIViewController, StoryBoarded {
    
    static var storyboardName: String = "Main"
    @IBOutlet weak var tblTodos: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus")?.withRenderingMode(.alwaysTemplate), style: .plain, target: self, action: #selector(onTapAdd))
        barButtonItem.tintColor = .black
        self.navigationItem.rightBarButtonItem = barButtonItem
        
        tblTodos.delegate = self
        tblTodos.dataSource = self
        tblTodos.estimatedRowHeight = 100
        tblTodos.rowHeight = UITableView.automaticDimension
        tblTodos.register(.init(nibName: "TaskCell", bundle: nil), forCellReuseIdentifier: "TaskCell")
        
        
    }
    
    @objc func onTapAdd() {
        let vc = AddTodoVC.ininstantiate()
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.navigationBar.prefersLargeTitles = true
        self.navigationController?.present(navigationController, animated: true)
    }


}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as? TaskCell else { return UITableViewCell() }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //go to details
        let vc = UpdateTodoVC.ininstantiate()
        navigationController?.pushViewController(vc, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
