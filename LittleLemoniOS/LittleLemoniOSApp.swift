//
//  LittleLemoniOSApp.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 15/11/2024.
//

import SwiftUI

@main
struct LittleLemoniOSApp: App {
    
    let persistenceController = PersistenceController.preview

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext).environmentObject(MyUserPreferences()).onAppear {
                    let directory = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
                    print(directory ?? "")
                }
        }
    }
}
