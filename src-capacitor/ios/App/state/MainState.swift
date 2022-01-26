import SwiftUI



class MainState: ObservableObject {
    // どのページにいるか
    @Published var toRouter: String = "Test"
    // TestSecのフォーム値
    @Published var CapacitorReturnData: String = ""
    
    @Published var getValueState: Bool = false
}


class subState {
    var hugahuga: Bool = false
}

