//
//  HomeViewController.swift
//  ZhiHuDaily
//
//  Created by Cocoa Lee on 15/7/5.
//  Copyright (c) 2015年 Cocoa Lee. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        getLunchImage()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func getLunchImage(){
        
        let lunchImageView = UIImageView(frame: view.bounds);
        lunchImageView.backgroundColor = UIColor ( red: 0.7488, green: 0.9865, blue: 0.6194, alpha: 1.0 )
        view.addSubview(lunchImageView)
        
        let urlString = "http://pic3.zhimg.com/d7f7dd90c013b1f115997047b8a6d5fe.jpg"
        if let url = NSURL(string: urlString){
            
            //            利用URL创建session
            let session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
            
            let dataTask = session.dataTaskWithURL(url, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
                if data  == nil{
                    println("获取数据失败")
                    lunchImageView.image = nil
                }else
                {
                    println("获取数据成功")
                    lunchImageView.image = UIImage(data: data!)
                    
//               self.saveLunchImage(data!)
                }
                
                
                
            })
            dataTask.resume()
            
        }
        
    }
    
    
    func saveLunchImage(imageData : NSData)->(){
        
        let home = NSHomeDirectory() as String
        let docPath = home.stringByAppendingPathComponent("Documents") as String
        let filepath = docPath.stringByAppendingPathComponent("lunchImageData.data")
        
        NSKeyedArchiver.archivedDataWithRootObject(imageData)
        
        
        self.readLunchImageData()
        
    }
    
    func readLunchImageData(){
        let home = NSHomeDirectory() as String
        let docPath = home.stringByAppendingPathComponent("Documents") as String
        let filepath = docPath.stringByAppendingPathComponent("lunchImageData.data")
//        let  data: AnyObject? = NSData.dataWithContentsOfMappedFile(filepath)
      
         let dd = NSData(contentsOfFile: filepath)
        println("data :\(dd)")
        let imgv = UIImageView(image: UIImage(data: dd!))
        imgv.frame = CGRect(x: 10, y: 10, width: 100, height: 100);
        view.addSubview(imgv)
        
        
        
    }
    
    
    
    
    override func viewWillAppear(animated: Bool) {
       
         navigationController?.navigationBarHidden = true
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
