//  Created by Отажон on 3/6/20.
//  Copyright © 2020 Otajon Ruzimov. All rights reserved.

import SwiftUI

struct ARView: View {
    struct CustomViewController : UIViewControllerRepresentable {
        func makeUIViewController(context: UIViewControllerRepresentableContext<CustomViewController>) -> UIViewController {
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            let controller = storyboard.instantiateViewController(identifier: "CustomViewController")
            return controller
        }
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {

        }

    }

    var body: some View {
            CustomViewController()
    }
}

struct ARView_Previews: PreviewProvider {
    static var previews: some View {
        ARView()
    }
}
