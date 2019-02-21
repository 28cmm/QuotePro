//
//  QuoteView.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-20.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    @IBOutlet var contentView: UIView!
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("View", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth , .flexibleHeight]
        
    }
    
    func updateText(quote:String, author:String){
        quoteLabel.text = quote
        authorLabel.text = author
    }
    
    func updatePic(img:UIImage){
        imageView.image = img
    }
}
