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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        callAlamo(url: searchURL)
    }
    
    func callAlamo(url : String){
        Alamofire.request(url).responseJSON(completionHandler: {
            response in
            
            self.parseData(JSONData: response.data!)
        })
    }
    
    func parseData(JSONData : Data) {
        do {
            var readableJSON = try JSONSerialization.jsonObject(with: JSONData, options: .mutableContainers) as? JSONStandard
            print(readableJSON)
        }
        catch {
            print(error)
        }
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
