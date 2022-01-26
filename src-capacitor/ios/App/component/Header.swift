import SwiftUI
import UIKit
import Capacitor


struct Header : View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var router: MainState
    
    @State private var showingAlert: Bool = false
    @State private var isShowCamera = false
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
                VStack {
                    Image(systemName: "house.fill")
                    Text("ホーム")
                }
            })
            
            
            Spacer()
            
            
            Button(action: {
                // router.toRouter = "CameraTest"
                isShowCamera = true
            }, label: {
                
                VStack {
                    Image(systemName: "camera")
                    Text("再スキャン")
                }
            })
                .fullScreenCover(isPresented: $isShowCamera) {
                    CameraTest()
                }
            
        }.padding(.horizontal)
            .background(Color.myColor(colorCode: .background))
        
        
    }
}



struct Header_Previews: PreviewProvider {
    static var previews: some View {
        Header()
    }
}
