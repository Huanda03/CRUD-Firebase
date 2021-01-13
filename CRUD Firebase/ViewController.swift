//
//  ViewController.swift
//  CRUD Firebase
//
//  Created by Mac2 on 13/01/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onAddTapped(_ sender: UIBarButtonItem) {
        AlertService.addUser(in: self){
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowInSection section: Int) -> Int{
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        AlertService.updateUser(in: self){
            
        }
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        guard editingStyle == .delete else { return }
    }
}
