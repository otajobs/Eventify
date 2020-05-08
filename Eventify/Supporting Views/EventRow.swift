//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct EventRow: View {
    var event: Event

    var body: some View {
        HStack {
            event.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(event.name)
            Spacer()

            if event.isFavorite {
                Image(systemName: "star.fill")
                    .imageScale(.medium)
                    .foregroundColor(.yellow)
            }
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            EventRow(event: eventData[0])
            EventRow(event: eventData[1])
        }
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
