//
//  Navigation.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 30/12/2024.
//

import SwiftUI


struct Header: View {
    @State var isLoggedIn = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    Image("Logo")
                    HStack {
                        Spacer()
                        if isLoggedIn {
//                            NavigationLink(destination: UserProfile()) {
                                Image("profile")
                                    .resizable()
                                    .aspectRatio( contentMode: .fit)
                                    .frame(maxHeight: 50)
                                    .clipShape(Circle())
                                    .padding(.trailing)
                            }
                        }
                    }
                }
            }
        }
   //     .frame(maxHeight: 50)
        
//        .onAppear() {
//            if UserDefaults.standard.bool(forKey: kIsLoggedIn) {
//                isLoggedIn = true
//            } else {
//                isLoggedIn = false
//            }
//        }
 //   }
}


struct Hero: View {
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("Little Lemon")
//                        .foregroundColor(Color.primaryColor2)
//                        .font(.displayFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Chicago")
//                        .foregroundColor(.white)
//                        .font(.subTitleFont())
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer(minLength: 5)
                    Text("""
                     We are a family owned Mediterranean restaurant, focused on traditional recipes served with a modern twist.
                     """)
                    .foregroundColor(.white)
//                    .font(.leadText())
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                Image("Hero-image")
                    .resizable()
                    .aspectRatio( contentMode: .fill)
                    .frame(maxWidth: 120, maxHeight: 140)
                    .clipShape(Rectangle())
                    .cornerRadius(16)
            }
        }
    }
}




