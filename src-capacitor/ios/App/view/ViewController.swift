//
//  ViewController.swift
//  App
//
//  Created by 中島慶樹 on 2022/01/17.
//

import Foundation
import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack {
            Button(action: {
                print("こんにちは")
            }, label: {
                Text("💩")
            })
        }.onAppear {
            print("DetailViewを表示")
          }.onDisappear {
            print("DetailViewを非表示")
          }
        
    }
}
