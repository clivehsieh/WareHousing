//
//  ViewController.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/4/25.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import UIKit

class WarehouseItemViewController: UITableViewController {

//    let itemArray = ["衛生紙", "餐巾紙", "捲筒衛生紙", "燈泡"]
    
    var itemArray = [Item]()

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let newItem = Item(context: context)
        newItem.title = "衛生紙"
        itemArray.append(newItem)

        let newItem2 = Item(context: context)
        newItem2.title = "餐巾紙"
        itemArray.append(newItem2)

        let newItem3 = Item(context: context)
        newItem3.title = "捲筒衛生紙"
        itemArray.append(newItem3)

        let newItem4 = Item(context: context)
        newItem4.title = "燈泡"
        itemArray.append(newItem4)
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WarehouseItemCell", for: indexPath)
        
        cell.textLabel?.text = itemArray[indexPath.row].title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArray.count
    
    }
    
    //MARK - Add New Items
    @IBAction func AddNewItem(_ sender: UIBarButtonItem) {
        
        var newItemTitle = UITextField()
        
        let addNewItem = Item(context: context)
        
        let alert = UIAlertController(title: "增加新物品", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "增加", style: .default) { (action) in
            //what will happne once the user clicks the Add Item button on our UIAlert
            
            addNewItem.title = newItemTitle.text!
            self.itemArray.append(addNewItem)
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "增加新物品"
            newItemTitle = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

}

