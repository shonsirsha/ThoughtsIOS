//
//  HelloVC.swift
//  Thoughts
//
//  Created by Sean Saoirse on 08/07/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import UIKit
var justLoggedOut = false

class HelloVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if(justLoggedOut){
            DispatchQueue.main.async(){
            self.performSegue(withIdentifier: "goToLogin2", sender: self)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
