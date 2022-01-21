import Foundation
import SwiftUI
import WebKit


struct WebView: UIViewRepresentable {
    var loadUrl:String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.load(URLRequest(url: URL(string: loadUrl)!))
    }
}


struct TestWebView: View {
    var body: some View {
        WebView(loadUrl: "https://www.google.com/?hl=ja")
    }
}


