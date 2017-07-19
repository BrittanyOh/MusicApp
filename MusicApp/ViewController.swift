//
//  ViewController.swift
//  MusicApp
//
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    @IBOutlet var menuView: UIView!

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    var menuShowing = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.layer.shadowOpacity = 1
    }

    @IBAction func toggleMenu(_ sender: AnyObject) {
        
        if(menuShowing){
            leadingConstraint.constant = 0
            menuShowing = false
        }else{
            leadingConstraint.constant = -150
            menuShowing = true
        }
    }

}

