//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import Combine
import SwiftUI

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var events = eventData
    
}
