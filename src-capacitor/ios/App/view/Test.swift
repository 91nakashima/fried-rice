import SwiftUI
import UIKit
import Capacitor

struct Test : View {
        @Environment(\.presentationMode) var presentationMode
    
    @State var isActiveSubView: Bool = false
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Capacitorに戻る")
        })
        
        NavigationView {
            VStack {
                
                NavigationLink(destination: TestSec(), isActive: $isActiveSubView) {
                    EmptyView()
                }
                
                
                Button(action: {
                    print("クリック1枚目")
                    self.isActiveSubView = true
                }, label: {
                    Text("swiftUI1枚目")
                })
            }.onAppear {
                print("Testを表示")
            }.onDisappear {
                print("Testを非表示")
            }
        }
    }
}
