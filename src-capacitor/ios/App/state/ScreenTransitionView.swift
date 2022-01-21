//
//  ScreenTransitionView.swift
//  App
//
//  Created by 中島慶樹 on 2022/01/17.
//

import SwiftUI

class Model: ObservableObject {
    var isNative : Bool = true
    
    func change(flg: Bool) {
        isNative = flg
    }
    
}
