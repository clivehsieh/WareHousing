//
//  Store.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/6/12.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import Foundation
import RealmSwift

class Store: Object {
    @objc dynamic var title = String()
    @objc dynamic var shortDescription = String()
//    let packageItems = LinkingObjects(fromType: PackagedItem.self, property: "store")
}
