//
//  EchoPlugin.swift
//  App
//
//  Created by 中島慶樹 on 2022/01/17.
//

import Capacitor
import SwiftUI

@objc(EchoPlugin)
public class EchoPlugin: CAPPlugin {
  @objc func echo(_ call: CAPPluginCall) {
//    let value = call.getString("value") ?? ""
//    call.resolve([
//        "value": value
//    ])
      
      let contentView = ContentView()
      
      let window = UIWindow(frame: UIScreen.main.bounds)
      window.rootViewController = UIHostingController(rootView: contentView)
//      self.window = window
      window.makeKeyAndVisible()
  }
}
