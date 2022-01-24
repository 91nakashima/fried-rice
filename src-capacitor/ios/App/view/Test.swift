import SwiftUI
import UIKit
import Capacitor


struct Test : View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var router: MainState
    
    
    var body: some View {
        
        
        VStack {
            Button(action: {
                router.toRouter = "TestSec"
            }, label: {
                Text("swiftUI1枚目")
            })
            
            
        }.onAppear {
            print("SwiftUIを表示")
        }.onDisappear {
            print("SwiftUIを非表示")
        }
        
        
        
    }
}
