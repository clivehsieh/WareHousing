//
//  HouseholdItems.swift
//  WareHousing
//
//  Created by Clive Hsieh on 2018/6/12.
//  Copyright © 2018年 Clive Hsieh. All rights reserved.
//

import Foundation
import RealmSwift

class HouseholdItem: Object {
    @objc dynamic var title = String()
    @objc dynamic var shortDescription = String()
    @objc dynamic var minimumQuantity = 0
    @objc dynamic var currentQuantity = 0
    @objc dynamic var sufficientQuantity = false
//    let packagedItems = List<PackagedItem>()

}
