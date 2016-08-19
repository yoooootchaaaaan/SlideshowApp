//
//  ExpansionViewController.swift
//  SlideshowApp
//
//  Created by 高橋伊希 on 2016/08/15.
//  Copyright © 2016年 yoshiki.takahashi. All rights reserved.
//

import UIKit

class ExpansionViewController: UIViewController {
    @IBOutlet weak var expantionImageView: UIImageView!
    
    var expansionIndex:Int = 0
    let photos = ["20160509-00010001-seraijp-000-view.jpg", "ダウンロード.jpeg", "o040003851435672936053.jpg", "nodoguro2.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image:UIImage! = UIImage(named: photos[expansionIndex])
        expantionImageView.image = image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}
