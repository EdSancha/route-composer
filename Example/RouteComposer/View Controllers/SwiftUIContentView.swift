//
//  SwiftUIContentView.swift
//  RouteComposer_Example
//
//  Created by Eugene Kazaev on 24/03/2020.
//  Copyright © 2020 Evgeny Kazaev. All rights reserved.
//

import Foundation
import SwiftUI
import RouteComposer

@available(iOS 13.0.0, *)
struct ContentView: View, ContextInstantiatable {

    let context: String

    init(context: String) {
        self.context = context
    }

    var body: some View {
        Text("Hello SwiftUI. Context is \(context)")
    }

}
