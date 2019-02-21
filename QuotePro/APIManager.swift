//
//  APIManager.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-20.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class APIManager {
    static func getQuote(closure:@escaping (String,String)->Void){        
        let request = NSMutableURLRequest(url: NSURL(string: "https://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        //request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
                
                guard let jsonUnformatted = try? JSONSerialization.jsonObject(with: data!, options: []), let json = jsonUnformatted as? [String:String] else {
                    print("data returned is not json, or not valid ")
                    return
                }
                print("the json = \(json)")
                if let quoteText = json["quoteText"] as? String, let quoteAuthor =  json["quoteAuthor"] as? String{
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        closure(quoteText,quoteAuthor)
                    }
                }else{
                    print("error, was not able to get the quote")
                }
            }
        })
        
        dataTask.resume()
    }
    
    static func getQicture(closure: @escaping (UIImage)->Void){
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://lorempixel.com/200/300/")! as URL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler:{(data, response, error) -> Void in
            if (error != nil){
                print(error!)
            }else{
                let httpResponse = response as? HTTPURLResponse

                if let randPic = UIImage(data: data!) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                        closure(randPic)
                    }
                }else{
                    print("Json is not a image")
                }
            }
        })
        dataTask.resume()
        
        
    }
}
