//
//  WriteThoughtVC.swift
//  Thoughts
//
//  Created by Sean Saoirse on 15/07/19.
//  Copyright © 2019 Sean Saoirse. All rights reserved.
//

import UIKit

class WriteThoughtVC: ViewControllerPannable,UITextViewDelegate {
    @IBOutlet weak var btnConst: NSLayoutConstraint!
    
    @IBOutlet weak var charLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.delegate = self
        
        textView.tintColor = UIColor.white
        
        textView.tintColorDidChange()
    
        
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
     
        
        textView.becomeFirstResponder()   
    }
    
    func textViewDidChange(_ textView: UITextView) { //
            let chars = textView.text.count
            charLabel.text = "\(chars)/200"
    }

   
    @IBAction func shareBtn(_ sender: Any) {
        if textView.text.trimmingCharacters(in: .whitespaces).isEmpty {
            print("Cant")
        }
    }
    
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            btnConst.constant = keyboardHeight
            
            //
        }
    }
    
  
    

    @IBAction func dismissBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
