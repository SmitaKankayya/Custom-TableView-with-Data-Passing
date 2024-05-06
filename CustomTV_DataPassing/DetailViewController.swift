//
//  DetailViewController.swift
//  CustomTV_DataPassing
//
//  Created by Smita Kankayya on 26/04/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var dImage: UIImageView!
    @IBOutlet var dLabel1: UILabel!
    @IBOutlet var dLabel2: UILabel!
    
    var strimg : UIImage!
    var strLabel1 : String!
    var strLabel2 : String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dLabel1.text = strLabel1
        dLabel2.text = strLabel2
        dImage.image = strimg
       
    }
}
