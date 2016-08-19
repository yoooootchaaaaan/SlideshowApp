//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 高橋伊希 on 2016/08/15.
//  Copyright © 2016年 yoshiki.takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var playAndStop: UIButton!
    
    var index:Int = 0
    var timer:NSTimer?
    var count:Int = 0 //0は一時停止中、1は再生中
    var expand:Int = 0 //0は縮小、1は拡大
    
    let photos = ["20160509-00010001-seraijp-000-view.jpg", "ダウンロード.jpeg", "o040003851435672936053.jpg", "nodoguro2.jpg"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let image:UIImage! = UIImage(named: photos[index])
        imageView.image = image
        
        }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        // segueから遷移先のResultViewControllerを取得する
        let expansionViewController:ExpansionViewController = segue.destinationViewController as! ExpansionViewController
        // 遷移先のExpansionViewControllerで宣言している変数に値を代入して渡す
        
        expansionViewController.expansionIndex = index
        expansionViewController.expandedPhoto = UIImage(named: photos[index])
        if(count == 0) { //一時停止中ならば
            //何も起こらない
        } else if(count == 1) { //再生中ならば
            timer!.invalidate()
        }
    }
    
    func updateImage() { //画像の更新
        let image:UIImage! = UIImage(named: photos[index])
        imageView.image = image
    }
    
    @IBAction func imageTapped(sender: UITapGestureRecognizer) {
        if(count == 0) { //一時停止中ならば
            //何も起こらない
        } else if(count == 1) { //再生中ならば
            timer!.invalidate()
        }
    }

    @IBAction func back(sender: AnyObject) { //戻るボタンを押した時に呼び出されるメソッド
        if(count == 0) { //一時停止中ならば
            if(index == 0) {
                index = photos.count - 1
            } else {
                index -= 1
            }
            self.updateImage()
        } else if(count == 1) { //再生中ならば
            //再生中は押しても何も起こらない
        }
    }

    @IBAction func playAndStop(sender: AnyObject) {
        if(count == 0) { //一時停止中ならば
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(self.timerNext(_:)), userInfo: nil, repeats: true) //タイマーを動かす
            playAndStop.setTitle("Ⅱ", forState: .Normal)
            count = 1 //再生中であることを示す
        } else if(count == 1) { //再生中ならば
            timer!.invalidate()
            playAndStop.setTitle("▶︎", forState: .Normal)
            count = 0 //一時停止中であることを示す
        }
    }
    
    func timerNext(sender: AnyObject) { //タイマーを起動したら2秒おきに呼び出されるメソッド
        if(index == photos.count - 1) {
            index = 0
        } else {
            index += 1
        }
        self.updateImage()
    }
    
    @IBAction func next(sender: AnyObject) { //進むボタンを押した時に呼び出されるメソッド
        if(count == 0) { //一時停止中ならば
            if(index == photos.count - 1) {
                index = 0
            } else {
                index += 1
            }
            self.updateImage()
        } else if(count == 1) { //再生中ならば
            //再生中は押しても何も起こらない
        }
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) { //遷移先（拡大画像）から戻ってくるときに呼ばれるメソッド
        if(count == 0) { //一時停止中ならば
            //何も起こらない
        } else if(count == 1) { //拡大する前に再生中だったならば
            timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: #selector(self.timerNext(_:)), userInfo: nil, repeats: true) //再びタイマーを動かす
        }
    }
    
}

