//
//  Podcast2.swift
//  RadioApp
//
//  Created by teamdoc on 11/11/2024.
//

import Foundation
import CoreData

@objc(Podcast2)
public class Podcast2: NSManagedObject {

    @NSManaged public var id: UUID
    @NSManaged public var title: String
    @NSManaged public override var description: String

}
