//
//  EchoPlugin.swift
//  App
//
//  Created by 中島慶樹 on 2022/01/17.
//

import Capacitor
import SwiftUI
import UIKit

@objc(EchoPlugin)
public class EchoPlugin: CAPPlugin {
    @objc func echo(_ call: CAPPluginCall) {
        let value = call.getString("value") ?? ""
        call.resolve([
            "value": value
        ])
    }
    
    @objc func toNativePage(_ call: CAPPluginCall) {
        
        DispatchQueue.main.async {
            let nativeViewController: UIViewController = UIHostingController(rootView: Test())
            nativeViewController.modalPresentationStyle = .fullScreen
            self.bridge?.viewController?.present(nativeViewController, animated: true, completion: nil)
        }
        
        call.resolve([
            "value": "ok"
        ])
    }
}
