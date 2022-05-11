//
//  Clients+CoreDataProperties.swift
//  CRUD MVVM
//
//  Created by user210203 on 5/9/22.
//
//

import Foundation
import CoreData


extension Clients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clients> {
        return NSFetchRequest<Clients>(entityName: "Clients")
    }

    @NSManaged public var birthDate: String?
    @NSManaged public var cpf: String?
    @NSManaged public var email: String?
    @NSManaged public var monthlyIncome: String?
    @NSManaged public var name: String?
    @NSManaged public var netWorth: String?

}

extension Clients : Identifiable {

}
