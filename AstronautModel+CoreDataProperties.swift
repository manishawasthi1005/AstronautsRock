//
//  AstronautModel+CoreDataProperties.swift
//  AstronautsRock
//
//  Created by manish.m.awasthi on 12.05.23.
//
//

import Foundation
import CoreData


extension AstronautModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<AstronautModel> {
        return NSFetchRequest<AstronautModel>(entityName: "AstronautModel")
    }

    @NSManaged public var name: String?
    @NSManaged public var profile_image: String?

}

extension AstronautModel : Identifiable {

}
