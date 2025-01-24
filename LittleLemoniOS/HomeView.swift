//
//  Untitled.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 15/11/2024.
//

import SwiftUI
import CoreData



struct HomeView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    var myModel: LittleLemonModel = LittleLemonModel()
 
    @FetchRequest(
            sortDescriptors: [NSSortDescriptor(keyPath: \MenuItem.id, ascending: true)],
            animation: .default)
    
    private var items: FetchedResults<MenuItem>
       
    var body: some View {
        
        
        VStack{
            Text("Home")
            NavigationLink(destination: ProfileView()) {
                    Text("Go to profile")
                }
            List {
                let _ = print("num of items:  \(items.count)")
                ForEach(items) { item in

                    Text("\(item.id) - \(item.title ?? "")")

                }
            }
            
            
        }.onAppear{
            myModel.fetchMenu(completion: { menuNetwork in
                switch menuNetwork {
                case .success(let menu):
                    print("menu: \(menu)")
                    myModel.saveMenu(menuNetwork: menu)
                case .failure(let error):
                    print(error)
                }
                
            })
        }
    
    }
}


