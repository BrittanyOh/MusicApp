//
//  ViewController.swift
//  MusicApp
//
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func toggleMenu(_ sender: AnyObject) {
        leadingConstraint.constant = 0
    }

}

