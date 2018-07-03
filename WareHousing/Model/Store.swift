//
//  Store.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/6/12.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import Foundation
import RealmSwift

class Store {
    @objc dynamic var store = String()
    let packageItems = LinkingObjects(fromType: PackagedItem.self, property: "store")
}
