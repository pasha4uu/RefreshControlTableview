//
//  ViewController.swift
//  RefreshControl
//
//  Created by PASHA on 30/07/18.
//  Copyright © 2018 Pasha. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var myTB: UITableView!
    
    var array = ["cell","cell","cell"]
    
    var refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refresh.attributedTitle = NSAttributedString(string: "swife to refresh")
        refresh.addTarget(self, action: #selector(refreshSwipe), for: .valueChanged)
         myTB.addSubview(refresh)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func refreshSwipe() {
        array.append("cell")
        myTB.reloadData()
        refresh.endRefreshing()
        
    }

}

extension ViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = array[indexPath.row]
        
        return cell!
        
    }
    
    
    
    
    
}
