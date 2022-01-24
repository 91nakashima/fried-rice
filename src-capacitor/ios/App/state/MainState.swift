import SwiftUI



class MainState: ObservableObject {
    // どのページにいるか
    @Published var toRouter: String = "Test"
    // TestSecのフォーム値
    @Published var CapacitorReturnData: String = ""
}
