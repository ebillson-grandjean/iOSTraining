//
//  SwiftUIWebView.swift
//  Assignment21SwiftUI
//
//  Created by Ebillson Grand Jean on 6/21/24.
//

import Foundation
import SwiftUI
import WebKit

struct SwiftUIWebView: UIViewRepresentable {
    
    typealias UIViewType = WKWebView

    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: "https://google.com/") else { return }
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}


#Preview {
    SwiftUIWebView()
}
