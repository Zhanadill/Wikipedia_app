//
//  ViewController2.swift
//  Wikipedia_app
//
//  Created by Жанадил on 2/18/21.
//  Copyright © 2021 Жанадил. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class VC2: UIViewController {
    var object:String?
    let wikipediaURL = Constants.apiKey
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestInfo(objectName: object!)
    }
    
    
    func requestInfo(objectName: String){
        let parameters: [String:String] = [
            "format": "json",
            "action": "query",
            "prop": "extracts|pageimages",
            "exintro": "",
            "explaintext": "",
            "titles": objectName,
            "indexpageids": "",
            "redirects": "1",
            "pithumbsize": "750"
        ]
        Alamofire.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            if response.result.isSuccess{
                let objectJSON:JSON = JSON(response.result.value!)
                let pageID = objectJSON["query"]["pageids"][0].stringValue
                let objectDescription = objectJSON["query"]["pages"][pageID]["extract"].stringValue
                self.label.text = objectDescription
                
                let objectImageURL = objectJSON["query"]["pages"][pageID]["thumbnail"]["source"].stringValue
                self.imageView.sd_setImage(with: URL(string: objectImageURL))
            }
        }
    }
}
