//
//  ProfileView.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 29/11/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userPreferences: MyUserPreferences
    
    @State private var validFields: Bool = false
    
    
    @State private var responseMessage: String = " "
    
    
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
   
    var body: some View {
     
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
                        .onboardingTextStyle()
                    HStack(spacing: 0) {
                        Image("profile")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
           
                        Spacer()
                    }
                }
                
                VStack{
                    Text("First name")
                    //       .onboardingTextStyle()
                    TextField("First Name", text: $firstName)
                }
                
                VStack {
                    Text("Last name")
                    //        .onboardingTextStyle()
                    TextField("Last Name", text: $lastName)
                    
                }
                
                VStack {
                    Text("E-mail")
                    //     .onboardingTextStyle()
                    TextField("E-mail", text: $email)
                        .keyboardType(.emailAddress)
                }
                
            
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            .onChange(of: firstName, initial: false) { oldValue, newValue in
                
                validateFields()
                
            }
            .onChange(of: lastName, initial: false) { oldValue, newValue in
                
                validateFields()
                
            }
            .onChange(of: email, initial: false) { oldValue, newValue in
                
                //check email
                
                validateFields()
            }
            
            
            Text(responseMessage).foregroundStyle(.red)
            
            
            
            Button("Log out") {
                
                userPreferences.userData = nil
                userPreferences.isLoggedIn = false
                
            }
            .buttonStyle(ButtonStyleYellowColorWide())
            Spacer(minLength: 20)
            
            
            Button("Save") {
                
                if firstName.isEmpty || lastName.isEmpty || email.isEmpty {
                    responseMessage = "Please fill all fields"
                    return
                }
                let userData = UserData(firstName: firstName, lastName: lastName, email: email)
                userPreferences.userData = userData
            }
            .buttonStyle(ButtonStylePrimaryColor1())
            .disabled(!validFields)
        
            
        }
        .onAppear {
            firstName = userPreferences.userData?.firstName ?? "" // viewModel.firstName
            lastName = userPreferences.userData?.lastName ?? "" //viewModel.lastName
            email = userPreferences.userData?.email ?? "" //viewModel.email
 
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
    
    
    func validateFields() {
        if firstName.isEmpty || lastName.isEmpty ||  !checkEmail(newValue: email) {
            validFields = false
            responseMessage  = "Please fill all fields"
        }
        else{
            validFields = true
            responseMessage  = " "
        }
    }

    func checkEmail(newValue: String) -> Bool{
        
        let myregex = #"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])"#
            
            
            if newValue.range(of: myregex, options: .regularExpression, range: nil, locale: nil) != nil {
               
                return true
            } else {
                return false
            }
               
     }
    
    
    
}
