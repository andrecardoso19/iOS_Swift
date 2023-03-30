//
//  User.swift
//  Appetizers
//
//  Created by andre.aragao on 30/03/23.
//

import Foundation

struct User: Codable {
    var firstName       = ""
    var lastName        = ""
    var email           = ""
    var birthDate       = Date()
    var extraNapkins    = false
    var frequentFills   = false
}
