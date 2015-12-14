//
//  AMUtil.swift
//  AMUtil
//
//  Created by Christian Quicano on 12/13/15.
//  Copyright © 2015 iphone4peru. All rights reserved.
//

import Foundation
import UIKit

public class AMUtil:NSObject {

    private override init(){
        
    }
    
    public class func loadJsonFromUrl(urlString:String, success:(json:AnyObject)->(), failure:()->()){
        AMUtil.loadDataFromUrl(urlString, success: { (data) -> () in
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    success(json: json)
                })
            }catch{
                print("falló el parse del json")
                failure()
            }
            }) { () -> () in
                failure()
        }
        
        
    }
    
    public class func loadImageFromURl(urlString:String, toImage:UIImageView, failure:()->()){
        AMUtil.loadDataFromUrl(urlString, success: { (data) -> () in
            if let image = UIImage(data: data){
                toImage.image = image
            }else{
                print("no se pudo crear la imagen")
                failure()
            }
            }) { () -> () in
                failure()
        }
    }
    
    class func loadDataFromUrl(urlString:String, success:(data:NSData)->(), failure:()->()) {
        NSOperationQueue().addOperationWithBlock { () -> Void in
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url) {
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        success(data: data)
                    })
                }else{
                    print("falló obtención de la data")
                    NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                        failure()
                    })
                }
            }else{
                print("falló creacion de url")
                NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                    failure()
                })
            }
        }
    }
    
}