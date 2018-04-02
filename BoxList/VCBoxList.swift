//
//  VCBoxList.swift
//  BoxList
//
//  Created by DEVaHmad on 4/2/18.
//  Copyright © 2018 DEVaHmad. All rights reserved.
//

import UIKit
import CoreData
class VCBoxList: UIViewController,UITableViewDelegate,UITableViewDataSource {

    let dequt = "ItemCell"
    @IBOutlet weak var tableViewList: UITableView!
    var listOfItems = [Items]()
    override func viewDidLoad() {
        super.viewDidLoad()
        loadItems()
        tableViewList.delegate   = self
        tableViewList.dataSource = self
        tableViewList.reloadData()
        // Do any additional setup after loading the view.
    }
    
    func loadItems(){
        let fetchRequest: NSFetchRequest<Items> = Items.fetchRequest()
        do{
            listOfItems = try context.fetch(fetchRequest)
        }catch {
            print("cannot load db")
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: dequt, for: indexPath) as! TVCItems
        cell.setitem(item: listOfItems[indexPath.row])
        return cell
    }
    
    
    
    
}
