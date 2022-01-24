import SwiftUI
import UIKit
import Capacitor


struct Header : View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showingAlert: Bool = false
    
    @State var isActivepresentationMode: Bool = false {
        willSet(willVal) {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    
    
    var body: some View {
        
        HStack {
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
                
            }, label: {
                Text("🏠")
            })
            
            
            Spacer()
            
            
            Button("👺") {
                self.showingAlert = true
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("再スキャン"),
                      message: Text("未実装"))
            }
        }.padding(.horizontal)
        
        
    }
}
