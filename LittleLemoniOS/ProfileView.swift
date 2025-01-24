//
//  ProfileView.swift
//  LittleLemoniOS
//
//  Created by Gabriele Colaianni on 29/11/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var userPreferences: MyUserPreferences
    
    @State private var valuesAreUpdated = false
        
    //    @State private var orderStatuses = true
    //    @State private var passwordChanges = true
    //    @State private var specialOffers = true
    //    @State private var newsletter = true
        
        @State private var firstName = ""
        @State private var lastName = ""
        @State private var email = ""
     //   @State private var phoneNumber = ""
        

    var body: some View {
        
        
  

//struct UserProfile: View {
  //  @StateObject private var viewModel = ViewModel()
    
//    @Environment(\.presentationMode) var presentation
    
//    @State private var orderStatuses = true
//    @State private var passwordChanges = true
//    @State private var specialOffers = true
//    @State private var newsletter = true
    
  
//    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
          //  NavigationLink(destination: Onboarding(), isActive: $isLoggedOut) { }
            VStack(spacing: 5) {
                VStack {
                    Text("Avatar")
             //           .onboardingTextStyle()
                    HStack(spacing: 0) {
                        Image("profile")
                            .resizable()
                            .aspectRatio( contentMode: .fit)
                            .frame(maxHeight: 75)
                            .clipShape(Circle())
                            .padding(.trailing)
//                        Button("Change") { }
//                            .buttonStyle(ButtonStylePrimaryColor1())
//                        Button("Remove") { }
//                            .buttonStyle(ButtonStylePrimaryColorReverse())
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
                
//                VStack {
//                    Text("Phone number")
//                 //       .onboardingTextStyle()
//                    TextField("Phone number", text: $phoneNumber)
//                        .keyboardType(.default)
//                }
            }
            .textFieldStyle(.roundedBorder)
            .disableAutocorrection(true)
            .padding()
            .onChange(of: firstName, initial: false) { oldValue, newValue in
               // if oldValue != newValue {
                    valuesAreUpdated = true
              //  }
            }
            .onChange(of: lastName, initial: false) { oldValue, newValue in
                 
                    valuesAreUpdated = true
                 
            }
            .onChange(of: email, initial: false) { oldValue, newValue in
                
                    valuesAreUpdated = true
                
            }
            
//            Text("Email notifications")
//                .font(.regularText())
//                .foregroundColor(.primaryColor1)
//            VStack {
//                Toggle("Order statuses", isOn: $orderStatuses)
//                Toggle("Password changes", isOn: $passwordChanges)
//                Toggle("Special offers", isOn: $specialOffers)
//                Toggle("Newsletter", isOn: $newsletter)
//            }
//            .padding()
//            .font(Font.leadText())
//            .foregroundColor(.primaryColor1)
//
            Button("Log out") {
                
              
                userPreferences.userData = nil
                userPreferences.isLoggedIn = false
                
                 
            }
//            .buttonStyle(ButtonStyleYellowColorWide())
            Spacer(minLength: 20)
            
            
            Button("Save") {
                let userData = UserData(firstName: firstName, lastName: lastName, email: email)
                userPreferences.userData = userData
            }.disabled(!valuesAreUpdated)
            
            
//            HStack {
//                Button("Discard Changes") {
//                    firstName = viewModel.firstName
//                    lastName = viewModel.lastName
//                    email = viewModel.email
//                    phoneNumber = viewModel.phoneNumber
//                    
////                    orderStatuses = viewModel.orderStatuses
////                    passwordChanges = viewModel.passwordChanges
////                    specialOffers = viewModel.specialOffers
////                    newsletter = viewModel.newsletter
////                    self.presentation.wrappedValue.dismiss()
//                }
////                .buttonStyle(ButtonStylePrimaryColorReverse())
//                Button("Save changes") {
//                    if viewModel.validateUserInput(firstName: firstName, lastName: lastName, email: email, phoneNumber: phoneNumber) {
//                        UserDefaults.standard.set(firstName, forKey: kFirstName)
//                        UserDefaults.standard.set(lastName, forKey: kLastName)
//                        UserDefaults.standard.set(email, forKey: kEmail)
//                        UserDefaults.standard.set(phoneNumber, forKey: kPhoneNumber)
//                        UserDefaults.standard.set(orderStatuses, forKey: kOrderStatuses)
//                        UserDefaults.standard.set(passwordChanges, forKey: kPasswordChanges)
//                        UserDefaults.standard.set(specialOffers, forKey: kSpecialOffers)
//                        UserDefaults.standard.set(newsletter, forKey: kNewsletter)
//                        self.presentation.wrappedValue.dismiss()
//                    }
//                }
////                .buttonStyle(ButtonStylePrimaryColor1())
//            }
//            if viewModel.errorMessageShow {
//                withAnimation() {
//                    Text(viewModel.errorMessage)
//                        .foregroundColor(.red)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.leading)
//                }
//            }
            
        }
        .onAppear {
            firstName = userPreferences.userData?.firstName ?? "" // viewModel.firstName
            lastName = userPreferences.userData?.lastName ?? "" //viewModel.lastName
            email = userPreferences.userData?.email ?? "" //viewModel.email
            valuesAreUpdated = false
   //         phoneNumber = viewModel.phoneNumber
            
//            orderStatuses = viewModel.orderStatuses
//            passwordChanges = viewModel.passwordChanges
//            specialOffers = viewModel.specialOffers
//            newsletter = viewModel.newsletter
        }
        .navigationTitle(Text("Personal information"))
        .navigationBarTitleDisplayMode(.inline)
    }
}
