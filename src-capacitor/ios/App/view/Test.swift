import SwiftUI
import UIKit
import Capacitor


struct Test : View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var router: MainState
    
    
    var body: some View {
        
        
        VStack {
            
            Button(action: {
                // router.toRouter = "TestSec"
                router.toRouter = "ARTest"
                
            }, label: {
                Text("swiftUI1枚目")
            })
            
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onAppear {
            print("SwiftUIを表示")
        }
        .onDisappear {
            print("SwiftUIを非表示")
        }
        
        
    }
}


