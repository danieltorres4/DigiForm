//
//  Database.swift
//  DigiForm
//
//  Created by Daniel ST on 17/01/24.
//

import Foundation
import CoreData
import UIKit

class Database {
    static let shared = Database()
    private init() {}
    
    func insertUserInfo(name: String, lastname: String, secondLastname: String, email: String, phoneNumber: String) -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false }
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        newUser.setValue(name, forKey: "name")
        newUser.setValue(lastname, forKey: "lastname")
        newUser.setValue(secondLastname, forKey: "secondLastname")
        newUser.setValue(email, forKey: "email")
        newUser.setValue(phoneNumber, forKey: "phoneNumber")
        
        do {
            try context.save()
            return true
        } catch {
            print("Error while saving values in DB")
            return false
        }
    }
    
    func readUserInfo() -> String? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return nil }
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        
        do {
            let result = try context.fetch(request)
            guard let returnedValue = result.last as? NSManagedObject else { return nil }
            
            for data in result as! [NSManagedObject] {
                print(data.value(forKey: "name") as! String)
            }
            
            guard let value = returnedValue.value(forKey: "name") as? String else { return nil }
            
            return value
        } catch {
            print("Error while reading User DB")
            return nil
        }
    }
}
