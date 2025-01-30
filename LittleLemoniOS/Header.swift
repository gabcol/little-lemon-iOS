//
//  Header.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 25/01/2025.
//

import SwiftUI

struct Header: View {
    
    @EnvironmentObject var userPreferences: MyUserPreferences
    @State var isLoggedIn = false
    
    var body: some View {

        VStack {
             
            
            ZStack {
                Image("Logo")
                
                
                HStack{
                    Spacer()
                    if isLoggedIn {
                        NavigationLink(destination: ProfileView()) {
                            
                            
                            Image("Profile")
                                .resizable()
                                .aspectRatio( contentMode: .fit)
                                .frame(maxHeight: 50)
                                .clipShape(Circle())
                                .padding(.trailing)
                            
                            
                            
                        }
                    }
                }
                
                
            }
        }.frame(maxHeight: 50)
            .onAppear() {
                    if UserDefaults.standard.bool(forKey: "isLoggedIn") {
                        isLoggedIn = true
                    } else {
                        isLoggedIn = false
                    }
                }
    }
}

