//
//  ViewController.swift
//  iBeaconTemplateSwift
//
//  Created by James Nick Sears on 7/1/14.
//  Copyright (c) 2014 iBeaconModules.us. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController{
//class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView?
    var beacons: [CLBeacon]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        
//        // 背景の色設定
//        myLabel.backgroundColor = UIColor.whiteColor()
//        
//        // 枠を丸くする.
//        myLabel.layer.masksToBounds = true
//        
//        // コーナーの半径.
//        myLabel.layer.cornerRadius = 20.0
//        
//        // Labelに文字を代入.
//        myLabel.text = "Hello Swift!!"
//        
//        // 文字の色を白にする.
//        myLabel.textColor = UIColor.blackColor()
//        
//        // 文字の影の色をグレーにする.
//        myLabel.shadowColor = UIColor.grayColor()
//        
//        // Textを中央寄せにする.
//        myLabel.textAlignment = NSTextAlignment.Center
//        
//        // 配置する座標を設定する.
//        myLabel.layer.position = CGPoint(x: self.view.bounds.width/2,y: 200)
//        
//        // Viewの背景色を白に
//        self.view.backgroundColor = UIColor.whiteColor()
//        
//        // ViewにLabelを追加.
//        self.view.addSubview(myLabel)
//        
//        // Do any additional setup after loading the view, typically from a nib.
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
}

extension ViewController: UITableViewDataSource {
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            if(beacons != nil) {
                return beacons!.count
            } else {
                return 0
            }
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell:UITableViewCell? =
            tableView.dequeueReusableCellWithIdentifier("MyIdentifier") as? UITableViewCell
            
            if(cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "MyIdentifier")
                cell!.selectionStyle = UITableViewCellSelectionStyle.None
            }
            
            let beacon:CLBeacon = beacons![indexPath.row]
            println(indexPath.row)
            var proximityLabel:String! = ""
            
            switch beacon.proximity {
            case CLProximity.Far:
                proximityLabel = "Far"
            case CLProximity.Near:
                proximityLabel = "Near"
            case CLProximity.Immediate:
                proximityLabel = "Immediate"
            case CLProximity.Unknown:
                proximityLabel = "Unknown"
            }
            
            
            //clear
            cell!.textLabel!.text = ""
            cell!.detailTextLabel!.text = ""
            
            
            let detailLabel:String = "Major: \(beacon.major.integerValue), " +
                "Minor: \(beacon.minor.integerValue), " +
                "RSSI: \(beacon.rssi as Int), " +
            "UUID: \(beacon.proximityUUID.UUIDString)"
            
            if(proximityLabel == "Near"){
                cell!.textLabel!.text = proximityLabel
                cell!.detailTextLabel!.text = detailLabel
                cell!.textLabel!.textColor = UIColor.orangeColor()
                
            }else if (proximityLabel == "Immediate"){
                cell!.textLabel!.text = proximityLabel
                cell!.detailTextLabel!.text = detailLabel
                cell!.textLabel!.textColor = UIColor.purpleColor()
                
            }else{
                println(proximityLabel)
                println("pass here")
                //clear
                cell!.textLabel!.text = ""
                cell!.detailTextLabel!.text = ""
            }
    
            
            return cell!
    }
}

extension ViewController: UITableViewDelegate {
    
}
