//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct EventDetail: View {
    @EnvironmentObject var userData: UserData
    var event: Event
    
    var eventIndex: Int {
        userData.events.firstIndex(where: { $0.id == event.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: event.locationCoordinate)
                .edgesIgnoringSafeArea(.top)
                .frame(height: 100)
            
            CircleImage(image: event.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Text(event.name)
                        .font(.system(size: 20))
                    
                    Button(action: {
                        self.userData.events[self.eventIndex]
                            .isFavorite.toggle()
                    }) {
                        if self.userData.events[self.eventIndex]
                            .isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                    Spacer()
                }
                
                HStack(alignment: .top) {
                    Text(event.description)
                        .font(.system(size: 18))
                        .fixedSize(horizontal: false, vertical: true)
                }.padding(5)
               
                HStack(alignment: .top) {
                    Text(event.timeEvent)
                        .font(.system(size: 16))
                    Spacer()
                    Text(event.organizer)
                    .font(.system(size: 16))
                }
                HStack(alignment: .top) {
                    Text(event.dateEvent)
                        .font(.system(size: 16))
                    Spacer()
                    Button("Join") {UIApplication.shared.open(URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSds7uzoYssDPb4u6v7E8tOHrvhn7VG3HbhuRY_bvNfkAjvcSw/viewform")!)}.font(.system(size: 16))
                }
                HStack(alignment: .top) {
                    Text(event.venueEvent)
                        .font(.system(size: 16))
                    Spacer()
                }
                HStack(alignment: .top) {
                    Text(event.priceEvent)
                        .font(.system(size: 16))
                    Spacer()
                }
                
            }
            .padding()
            Spacer()
        }
    }
}

struct EventDetail_Previews: PreviewProvider {
    static var previews: some View {
        let userData = UserData()
        return EventDetail(event: userData.events[0])
            .environmentObject(userData)
    }
}
