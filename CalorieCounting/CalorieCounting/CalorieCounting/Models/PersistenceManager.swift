//
//  PersistenceManager.swift
//  CalorieCounting
//
//  Created by Emil Mubarakov on 14.12.2020.
//

import CoreData

class PersistenceManager {
    
    static let shared = PersistenceManager()
    
    var conetext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    var entity: NSEntityDescription? {
        return NSEntityDescription.entity(forEntityName: Constant.Persistence.entityName, in: conetext)
    }
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: Constant.Persistence.contextName)
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                print("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func delete(_ food: Food) {
        let context = persistentContainer.viewContext
        context.delete(food)
        saveContext()
    }
    
    func retrieveAllFoods() -> [Food] {
        let emptyFoods = [Food]()
        let context = persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Constant.Persistence.entityName)
        do {
            guard let foods = try context.fetch(fetchRequest) as? [Food] else { return emptyFoods }
            return foods
        }
        catch {
            let nserror = error as NSError
            print("Unresolved error \(nserror), \(nserror.userInfo)")
            return emptyFoods
        }
    }
}
