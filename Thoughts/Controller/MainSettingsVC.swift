//
//  MainSettingsVC.swift
//  Thoughts
//
//  Created by Sean Saoirse on 08/07/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import UIKit

class MainSettingsVC: UITableViewController {
    @IBOutlet var myTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        self.myTableView.tableFooterView = UIView()

    }
    func setupNavbar(){
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    @IBAction func signOutBtn(_ sender: Any) {
        AuthService.instance.signOut { (signedOut) in
            if(signedOut){
                justLoggedOut = true
                self.tabBarController?.view.removeFromSuperview()
                self.performSegue(withIdentifier: "wow", sender: self)               
            }else{
                print("b")
            }
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
          self.tabBarController?.navigationItem.title = "Settings"
    }

  
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
