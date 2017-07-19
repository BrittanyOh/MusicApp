//
//  ViewController.swift
//  MusicApp
//
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var menuShadow: NSLayoutConstraint!
    
    var menuShowing = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toggleMenu(_ sender: AnyObject) {
        
        if(menuShowing){
            leadingConstraint.constant = 0
            menuShadow.constant = -149
            
            UIView.animate(withDuration: 0.3, animations: {self.view.layoutIfNeeded()})
            menuShowing = false
        }else{
            leadingConstraint.constant = -150
            menuShadow.constant = -158
            UIView.animate(withDuration: 0.2, animations: {self.view.layoutIfNeeded()})
            menuShowing = true
        }
    }

}

