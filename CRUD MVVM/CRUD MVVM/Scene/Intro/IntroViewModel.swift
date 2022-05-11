//
//  IntroViewModel.swift
//  CRUD MVVM
//
//  Created by user210203 on 4/28/22.
//

import Foundation
import UIKit
import CoreData

class IntroViewModel {
    let service = CoreDataService()
    
    func fetchData() {
        service.fetchData()
    }
    
}
