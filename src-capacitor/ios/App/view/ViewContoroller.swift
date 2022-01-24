import SwiftUI
import UIKit
import Capacitor


enum Router {
    case Test
    case TestSec
}


struct ViewContoroller : View {
    
    @EnvironmentObject var router: MainState
    
    
    var body: some View {
        
        Header() // ヘッダー
        
        TabView(selection: $router.toRouter) {
            Test()
                .tag("Test")
            
            TestSec()
                .tag("TestSec")
        }
        
    }
}
