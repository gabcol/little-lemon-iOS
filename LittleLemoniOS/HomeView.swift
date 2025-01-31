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
    
    @EnvironmentObject var userPreferences: MyUserPreferences
    
    
    var myModel: LittleLemonModel = LittleLemonModel()
    
    
    @State var isKeyboardVisible = false
    @State var searchText = ""
    
   // @State var menuIsLoaded = false
    
    @State var startersIsEnabled = true
    @State var mainsIsEnabled = true
    @State var dessertsIsEnabled = true
    @State var drinksIsEnabled = true
    
    
    var body: some View {
        
        TabView {
            
            NavigationView {
                
                
                VStack{
                    
                    Header().environmentObject(userPreferences)
                    
                    VStack {
                        if !isKeyboardVisible {
                            withAnimation() {
                                Hero()
                                    .frame(maxHeight: 170)
                            }
                            
                        }
                        TextField("Search menu", text: $searchText)
                        
                            .textFieldStyle(.roundedBorder)
                    }
                    .padding()
                    .background(Color.primaryColor1)
                    
                    
//                    Text("ORDER FOR DELIVERY!")
//                        .font(Font.custom("Karla Regular", size: 18).weight(.black))
//                        .foregroundColor(.highlightColor2)
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        .padding(.top)
//                        .padding(.leading)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            Toggle("Starters", isOn: $startersIsEnabled)
                            Toggle("Mains", isOn: $mainsIsEnabled)
                            Toggle("Desserts", isOn: $dessertsIsEnabled)
                            Toggle("Drinks", isOn: $drinksIsEnabled)
                        }
                        .toggleStyle(CustomToggleStyle())
                        .padding(.horizontal)
                    }
                    
                    
                    FetchedObjects(predicate: buildPredicate(),
                                   sortDescriptors: buildSortDescriptors()) {
                        (dishes: [MenuItem]) in
                        List(dishes) { dish in
                            NavigationLink(destination: DetailItem(dish: dish)) {
                                FoodItem(dish: dish)
                            }
                        }
                        .listStyle(.plain)
                    }
                    
                    
                }.onAppear{
                    
                    myModel.fetchMenu(completion: { menuNetwork in
                        switch menuNetwork {
                        case .success(let menu):
                            //menuIsLoaded =
                            myModel.saveMenu(menuNetwork: menu)
                        case .failure(let error):
                            print(error)
                        }
                    })
                    
                    
                }
                
               
            }.tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            ProfileView().tabItem {
                Image(systemName: "person.circle")
                Text("Profile")
            }
        }
        
        
        
    }
    
    func buildSortDescriptors() -> [NSSortDescriptor] {
        return [NSSortDescriptor(key: "title",
                                 ascending: true,
                                 selector:
                                    #selector(NSString.localizedStandardCompare))]
    }
    
    func buildPredicate() -> NSCompoundPredicate {
        let search = searchText == "" ? NSPredicate(value: true) : NSPredicate(format: "title CONTAINS[cd] %@", searchText)

        let starters = !startersIsEnabled ? NSPredicate(format: "category != %@", "starters") : NSPredicate(value: true)
        let mains = !mainsIsEnabled ? NSPredicate(format: "category != %@", "mains") : NSPredicate(value: true)
        let desserts = !dessertsIsEnabled ? NSPredicate(format: "category != %@", "desserts") : NSPredicate(value: true)
        let drinks = !drinksIsEnabled ? NSPredicate(format: "category != %@", "drinks") : NSPredicate(value: true)
        
        let compoundPredicate = NSCompoundPredicate(andPredicateWithSubpredicates: [search, starters, mains, desserts, drinks])
    
        
        
        NSSortDescriptor(
            key: "name",
            ascending: true,
            selector: #selector(NSString.localizedCompare)
        )
        
        return compoundPredicate
    }
}


struct CustomToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button {
            configuration.isOn.toggle()
        } label: {
            HStack {
                configuration.label
            }
        }
        .foregroundColor(Color.primaryColor1)
        .padding(5)
        .background {
            if configuration.isOn {
                Color.highlightColor1
            }
        }
        .cornerRadius(8)
    }
}
