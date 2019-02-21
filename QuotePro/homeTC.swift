//
//  homeTC.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-19.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class homeTC: UITableViewCell {

    @IBOutlet weak var quoteView: QuoteView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func upDate(image:UIImage, author:String, detail:String){
        quoteView.updatePic(img: image)
        quoteView.updateText(quote: detail, author: author)
    }

}
