//
//  Person+CoreDataProperties.swift
//  Matematic
//
//  Created by  Джон Костанов on 25/09/2019.
//  Copyright © 2019 John Kostanov. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?
    @NSManaged public var points: Points?

}
