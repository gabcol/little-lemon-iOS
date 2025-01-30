//
//  ContentView.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 15/11/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    //share preferences
    @EnvironmentObject var userPreference: MyUserPreferences
    
    let myModel = LittleLemonModel()
    
    var body: some View {
        
        
        NavigationView {
           
            if userPreference.isLoggedIn {
                HomeView().environment(\.managedObjectContext, viewContext).environmentObject(userPreference)
            }
            else{
                OnboardingView().environmentObject(userPreference)
            }
        }
    }
    
}

