//
//  MyUserPreferences.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 15/11/2024.
//

import SwiftUI


class MyUserPreferences : ObservableObject {
    
    @Published var isLoggedIn: Bool = false
     
    @Published var userData: UserData? = nil {
        didSet {
            isLoggedIn = userData != nil
            
            UserDefaults.standard.set(isLoggedIn, forKey: "isLoggedIn")
            UserDefaults.standard.set(userData?.email, forKey: "userEmail")
            UserDefaults.standard.set(userData?.firstName, forKey: "userFirstName")
            UserDefaults.standard.set(userData?.lastName, forKey: "userLastName")
            
            UserDefaults.standard.synchronize()
        }
    }
    
    init () {
        isLoggedIn = UserDefaults.standard.bool(forKey: "isLoggedIn")
        if isLoggedIn {
            userData = UserData( firstName: UserDefaults.standard.string(forKey: "userFirstName")!, lastName: UserDefaults.standard.string(forKey: "userLastName")!, email: UserDefaults.standard.string(forKey: "userEmail")!)
        }
        
    }
    
    
//    func setUserData(userData: UserData){
//        
//    }
//    
//    func getUserData(){
//        
//    }
    
}


