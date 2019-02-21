//
//  detailViewViewController.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-20.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class detailViewViewController: UIViewController {
    
    @IBOutlet weak var quoteView: QuoteView!
    var authorText = ""
    var detailText = ""
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       changeImage(self)
        changeQuoteButton(self)
    }
    
    @IBAction func changeQuoteButton(_ sender: Any) {
        let closure = {(quote:String , author:String )->Void in
            print("quote = \(quote) , autor = \(author)")
            self.updateQuote(quote: quote, author: author)
        }
        APIManager.getQuote(closure: closure)
    }
    
    func updatePic(image:UIImage){
        self.image = image
        quoteView.updatePic(img: image)
    }
    
    func updateQuote(quote: String, author: String){
        self.authorText = author
        self.detailText = quote
        quoteView.updateText(quote: quote, author: author)
    }
    
    @IBAction func changeImage(_ sender: Any) {
        let closure = {(pic:UIImage)->Void in
            print("pic = \(pic)")
            self.updatePic(image: pic)
            
        }
        APIManager.getQicture(closure: closure)
    }
   
    @IBAction func addButton(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let context = appDelegate!.persistentContainer.viewContext
        let info = Info(context: context)
        
       info.author = authorText
        info.deteal = detailText
        info.image = image!.pngData()
        
        appDelegate!.saveContext()
        self.navigationController?.popViewController(animated: true)
    }
    

}
