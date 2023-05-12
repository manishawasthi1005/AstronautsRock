//
//  DataController.swift
//  AstronautsRock
//
//  Created by manish.m.awasthi on 12.05.23.
//

import CoreData
import Foundation

class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "AstronautDataModel")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Core Data failed to Load: \(error.localizedDescription)")
            }
            
        }
    }
}
