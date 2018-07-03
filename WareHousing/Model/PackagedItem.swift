//
//  PackagedItem.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/6/12.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import Foundation
import RealmSwift

class PackagedItem: Object {
    @objc dynamic var title = String()
    @objc dynamic var shortDescription = String()
//    let stores = List<Store>()
//    let relatedHouseholdItem = LinkingObjects(fromType: HouseholdItem.self, property: "packagedItems")
    
}
