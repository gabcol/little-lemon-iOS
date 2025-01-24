//
//  Onboarding.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 15/11/2024.
//
import SwiftUI

struct OnboardingView: View {
    
    
    @EnvironmentObject var userPreferences: MyUserPreferences
    
    @State var name: String = ""
    @State var surname: String = ""
    @State var email: String = ""
    
    @State var responseMessage: String = ""
    
    var body: some View {
        
        VStack {
            Text("Onboarding")
         
            HStack{
                Text("Name")
                TextField("add you name", text: $name)
            }
            
            HStack{
                Text("Surname")
                TextField("add your surname", text: $surname)
            }
           
            HStack{
                Text("email")
                TextField("add your email", text: $email)
            }
           
    
            Text(responseMessage)
            
            
            Button("Next") {
                
                if name.isEmpty || surname.isEmpty || email.isEmpty {
                    responseMessage = "Please fill all fields"
                    return
                }
                
                userPreferences.userData = UserData(firstName :  name, lastName : surname, email : email)
                
            }
            
           
        }
        
    }
}
