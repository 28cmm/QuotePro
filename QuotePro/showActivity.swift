//
//  showActivity.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-20.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit

class showActivity: UIViewController {
    static var quoteInfo: Info!

    @IBOutlet weak var quoteView: QuoteView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        quoteView.updateText(quote: showActivity.quoteInfo.deteal!, author: showActivity.quoteInfo.author!)
        let converImage = UIImage(data: showActivity.quoteInfo.image!)
        quoteView.updatePic(img: converImage!)
    }
    
    
    @IBAction func shareButton(_ sender: Any) {
        let image = snapshot(view: quoteView)
        let imageToShare = [image]
        let ac = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        present(ac, animated: true)
        
    }
    
    func shared(){
        
    }
    
    func snapshot(view:UIView) -> UIImage
{
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
    view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
