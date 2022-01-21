import SwiftUI
import UIKit
import Capacitor

struct TestSec : View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("swiftUI2枚目")
            })
        }.navigationBarBackButtonHidden(true).onAppear {
            print("Testを表示")
        }.onDisappear {
            print("Testを非表示")
        }
    }
}
