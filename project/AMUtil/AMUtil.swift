//
//  AMUtil.swift
//  AMUtil
//
//  Created by Christian Quicano on 12/13/15.
//  Copyright © 2015 iphone4peru. All rights reserved.
//

import Foundation

public class AMUtil:NSObject {

    private override init(){
        
    }
    
    class func loadJsonFromUrl(urlString:String, success:(json:AnyObject)->()){
        NSOperationQueue().addOperationWithBlock { () -> Void in
            if let url = NSURL(string: urlString) {
                if let data = NSData(contentsOfURL: url) {
                    do {
                        let json = try NSJSONSerialization.JSONObjectWithData(data, options: [])
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            success(json: json)
                        })
                    }catch{
                        print("falló el parse del json")
                    }
                }else{
                    print("falló obtención de la data")
                }
            }else{
                print("falló creacion de url")
            }
        }
    }
    
}