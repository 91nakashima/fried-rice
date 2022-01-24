import SwiftUI
import UIKit
import Capacitor

struct TestSec : View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var text: MainState
    
    
    var body: some View {
        VStack {
            Text("swiftUI2枚目")
            TextField("プレースホルダー", text: $text.CapacitorReturnData).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                print("==========")
                print(text.CapacitorReturnData)
                print("==========")
                
            }, label: {
                Text("Capacitorに戻る")
            })
        }.navigationBarBackButtonHidden(true).onAppear {
            print("TestSecを表示")
        }.onDisappear {
            print("TestSecを非表示")
        }
    }
}
