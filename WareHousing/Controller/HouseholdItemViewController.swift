//
//  ViewController.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/4/25.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import UIKit
import RealmSwift

class HouseholdItemViewController: UITableViewController {

    let realm = try! Realm()
    
    var item : Results<HouseholdItem>?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadItems()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
    }
    
    //MARK - Tableview Datasource Methods
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HouseholdItemCell", for: indexPath)
        
        cell.textLabel?.text = item?[indexPath.row].title ?? "No item is listed"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item?.count ?? 1
    
    }
    
    //MARK - Add New Items
    @IBAction func AddNewItem(_ sender: UIBarButtonItem) {
        
        var newItemTitle = UITextField()
        var newItemShortDescription = UITextField()
        
        let addNewItem = HouseholdItem()
        
        let alert = UIAlertController(title: "增加新物品", message: "", preferredStyle: .alert)
        
        let actionAdd = UIAlertAction(title: "增加", style: .default) { (action) in
            //what will happne once the user clicks the Add Item button on our UIAlert
            
            addNewItem.title = newItemTitle.text!
            addNewItem.shortDescription = newItemShortDescription.text!
            self.tableView.reloadData()
            self.saveItem(item: addNewItem)
            
        }
        
        let actionCancel = UIAlertAction(title: "取消", style: .default) { (action) in
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "新物品名稱"
            newItemTitle = alertTextField
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "新物品簡介"
            newItemShortDescription = alertTextField
        }
        
        alert.addAction(actionAdd)
        alert.addAction(actionCancel)
        present(alert, animated: true, completion: nil)
        
    }
    
    //MARK - Model Manipulation Methods
    
    func saveItem(item: HouseholdItem){
    
        do {
            try realm.write {
                realm.add(item)
                
            }
        
        } catch {
            print("Error saving context\(error)")
        }
    
        self.tableView.reloadData()
    }
    
    func loadItems() {
        
        item  = realm.objects(HouseholdItem.self)
        
        tableView.reloadData()
        
        }
    
}

