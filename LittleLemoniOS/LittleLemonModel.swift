//
//  File.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 02/12/2024.
//

import Foundation
import CoreData


class LittleLemonModel
{
    
    @MainActor func fetchMenu(completion: @escaping (Result<MenuNetwork, Error>) -> Void)  {
        
        PersistenceController.preview.clearDataBase()
        
        URLSession.shared.dataTask(with: URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")!) { data, response, error   in
            guard let data else {
                print("Error: \(error?.localizedDescription ?? "Empty menu")")
               
                completion(Result.failure(NSError(domain: "", code: 0, userInfo:nil)))
                return
            }
            do {
                let menu = try JSONDecoder().decode(MenuNetwork.self, from: data)
                DispatchQueue.main.async {
                    completion(Result.success(menu))
                }
               
            }
            catch {
                print("Error: \(error.localizedDescription)")
                
                completion(Result.failure(error))
            }
        }.resume()
    }
    
    
    func saveMenu(menuNetwork: MenuNetwork) -> Bool {
        let context = PersistenceController.preview.container.viewContext
        let menuEntity = MenuLittleLemon(context: context)
         
        menuNetwork.menu.map {

           let entity = self.convert($0, context: context)
           entity.menu = menuEntity
           
           return entity
        }
        
        do {
            try? context.save()
            print("saving successfullly menu")
            return true
        }
        catch {
            print("error saving menu")
            return false
        }
    }
    
    func convert(_ menuItemNetwork: MenuItemNetwork, context: NSManagedObjectContext) -> MenuItem {
        

        let menuItem = MenuItem(context: context)
        
        menuItem.id = Int32(menuItemNetwork.id)
        menuItem.title = menuItemNetwork.title
        menuItem.descr = menuItemNetwork.description
        menuItem.image = menuItemNetwork.image
        menuItem.price = menuItemNetwork.price
        menuItem.category = menuItemNetwork.category
        
        return menuItem
    }
    
    
}
