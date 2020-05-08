//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct CategoryRow: View {
    var categoryName: String
    var items: [Event]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false) {
               HStack(alignment: .top, spacing: 0) {
                    ForEach(self.items) { event in
                        NavigationLink(
                            destination: EventDetail(
                                event: event
                            )
                        ) {
                            CategoryItem(event: event)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryItem: View {
    var event: Event
    var body: some View {
        VStack(alignment: .leading) {
            event.image
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            Text(event.name)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.leading, 15)
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(
            categoryName: eventData[0].category.rawValue,
            items: Array(eventData.prefix(4))
        )
        .environmentObject(UserData())
    }
}
