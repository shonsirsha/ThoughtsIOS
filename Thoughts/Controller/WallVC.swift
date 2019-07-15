//
//  WallVC.swift
//  Thoughts
//
//  Created by Sean Saoirse on 08/07/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import UIKit

class WallVC: UIViewController,UITableViewDelegate,UITableViewDataSource,NewWallCell {
    
    var refreshControl = UIRefreshControl()

    @IBOutlet weak var floatyBtn: Floaty!
    
    @IBOutlet weak var myTableView: UITableView!
    let myArr = ["When you are able to shift your inner awareness to how you can serve others, and when you make this the central focus of your life, you will then be in a position to know true miracles in your progress toward prosperity", "Concieve believe achieve, ctfu!"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2470588235, green: 0.7960784314, blue: 0.5568627451, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(WallVC.newPost(_:)))
        
        self.floatyBtn.addGestureRecognizer(gesture)
        
        
        
        myTableView.estimatedRowHeight = 120
        myTableView.rowHeight = UITableView.automaticDimension
        
        addRefreshControl()
        // Do any additional setup after loading the view.
    }
    
    // or for Swift 4
    @objc func newPost(_ sender:UITapGestureRecognizer){
        performSegue(withIdentifier: "toWriteThoughtVC", sender: self)
    }
    
    func addRefreshControl(){
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.white
        refreshControl.addTarget(self, action: #selector(refreshList), for: .valueChanged)
        myTableView.refreshControl = refreshControl
        
        
    }
    
    func onTapLoveBtn(Index: Int, sender: UIButton) {
    
        if sender.isHighlighted{
            sender.isHighlighted = false
        }else{
            sender.isHighlighted = true
        }
        
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
        
      

       
        
       
    }
    
    @IBAction func s(_ sender: Any) {
    }
    
    @objc func refreshList(){
        refreshControl.endRefreshing()
    }
    
    func setupNavbar(){
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    
    override func viewWillAppear(_ animated: Bool) { self.tabBarController?.navigationItem.title = "Thoughts"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myWallCell") as? WallCell else {return UITableViewCell()}
        let eachDocsObj = myArr[indexPath.row]
        cell.configCell(title: eachDocsObj)
        cell.cellDelegate = self
        cell.index = indexPath
        return cell
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
