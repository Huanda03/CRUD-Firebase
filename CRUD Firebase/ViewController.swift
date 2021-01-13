//
//  ViewController.swift
//  CRUD Firebase
//
//  Created by Mac2 on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onAddTapped(_ sender: UIBarButtonItem) {
        AlertService.addUser(in: self){ user in
            print(user)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowInSection section: Int) -> Int{
        return users.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        let user = users[indexPath.row]
        cell.textLabel?.text = user.name
        cell.detailTextLabel?.text = String(user.age)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let user = users[indexPath.row]
        AlertService.update(user, in: self){ updatedUser in
            print(updatedUser)
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        guard editingStyle == .delete else { return }
    }
}
