//
//  Search.swift
//  MusicApp
//
//  Copyright © 2017 Britt&Gelly. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class Search: UIViewController{
    
    
    
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    var menuShowing = true
    
    var searchURL = "https://api.spotify.com/v1/search?q=Beyonce&type=track"
    
    typealias JSONStandard =  [String : AnyObject]
    
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
