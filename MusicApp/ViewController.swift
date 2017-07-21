//
//  ViewController.swift
//  MusicApp
//
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toggleMenu(_ sender: AnyObject) {
        
        if(menuShowing){
            leadingConstraint.constant = 0
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            menuShowing = false
        }else{
            leadingConstraint.constant = -150
            UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
            menuShowing = true
        }
    }

}

