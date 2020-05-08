//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct EventList: View {
    @EnvironmentObject private var userData: UserData
    
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favorites Only")
            }
            
            ForEach(userData.events) { event in
                if !self.userData.showFavoritesOnly || event.isFavorite {
                    NavigationLink(
                        destination: EventDetail(event: event)
                            .environmentObject(self.userData)
                    ) {
                        EventRow(event: event)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Events"))
    }
}

struct EventList_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(["iPhone SE"], id: \.self) { deviceName in
            NavigationView {
                EventList()
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
        .environmentObject(UserData())
    }
}
