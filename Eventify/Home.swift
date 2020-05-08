//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct CategoryHome: View {
    var categories: [String: [Event]] {
        Dictionary(
            grouping: eventData,
            by: { $0.category.rawValue }
        )
    }
    
    @State var showingProfile = false
    
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "arkit")
                .imageScale(.large)
                .accessibility(label: Text("User Profile"))
                .padding()
        }
        
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, items: self.categories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: EventList()) {
                    Text("See All")
                }
            }
            .navigationBarTitle(Text("Eventify"))
             .navigationBarItems(trailing:
                HStack {
                NavigationLink(destination: ARView()) {
                Image(systemName: "arkit")
                    .font(.system(size: 26))
                    }
                            }
                        )
                    }
                }
            }

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
            .environmentObject(UserData())
    }
}
