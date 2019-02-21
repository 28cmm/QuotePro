//
//  ViewController.swift
//  QuotePro
//
//  Created by Yilei Huang on 2019-02-19.
//  Copyright © 2019 Joshua Fang. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return info.count
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//            let cell =
//            return UITableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath as IndexPath) as! homeTC
           // let index = info[indexPath.row]
            cell.upDate(image: UIImage(data:info[indexPath.row].image!)!, author: info[indexPath.row].author!, detail: info[indexPath.row].deteal!)
//            cell. =
            
            return cell
        }
    
    @IBAction func addButton(_ sender: Any) {
        performSegue(withIdentifier: "goDetail", sender: self)
    }
    

    @IBOutlet weak var myTableVIew: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        myTableVIew.dataSource = self
        myTableVIew.delegate = self
        
        
       
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    var info = [Info]()
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showActivity.quoteInfo = info[indexPath.row]
        //performSegue(withIdentifier: "goShare", sender: self)
    }
    
    override func viewDidAppear(_ animated: Bool) {
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let request: NSFetchRequest<Info> = Info.fetchRequest()
        let context = appDelegate.persistentContainer.viewContext
        if let result = try? context.fetch(request), result.count>0{
            info = result
            myTableVIew.reloadData()
        }else{
            print("unable to retrieve data/no data exist ")
        }
    }

    
}

