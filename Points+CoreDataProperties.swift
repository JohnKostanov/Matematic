//
//  Points+CoreDataProperties.swift
//  Matematic
//
//  Created by  Джон Костанов on 25/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//
//

import Foundation
import CoreData


extension Points {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Points> {
        return NSFetchRequest<Points>(entityName: "Points")
    }

    @NSManaged public var currentExperience: Int32
    @NSManaged public var currentDimond: Int16
    @NSManaged public var currentHeart: Int16
    @NSManaged public var summaBasicPoints: Int32
    @NSManaged public var substractionBasicPoints: Int32
    @NSManaged public var summaSubstractionPoints: Int32
    @NSManaged public var multiplicationBasicPoints: Int32
    @NSManaged public var divisionBasicPoints: Int32
    @NSManaged public var person: Person?

}
