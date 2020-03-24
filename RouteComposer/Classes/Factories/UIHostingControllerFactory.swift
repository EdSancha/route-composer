//
// Created by Eugene Kazaev on 24/03/2020.
//

#if os(iOS)

import Foundation
import UIKit

import SwiftUI

public protocol ContextInstantiatable {

    associatedtype Context

    var context: Context { get }

    init(context: Context)

}

@available(iOS 13.0.0, *)
public struct UIHostingControllerFactory<ContentView: View & ContextInstantiatable>: Factory {

    public typealias ViewController = UIHostingController<ContentView>

    public typealias Context = ContentView.Context

    public init() {
    }

    public func build(with context: Context) throws -> UIHostingController<ContentView> {
        let viewController = UIHostingController(rootView: ContentView(context: context))
        return viewController
    }

}

@available(iOS 13.0.0, *)
public struct UIHostingControllerFinder<ContentView: View & ContextInstantiatable>: StackIteratingFinder where ContentView.Context: Equatable {

    public typealias ViewController = UIHostingController<ContentView>

    public typealias Context = ContentView.Context

    /// A `StackIterator` is to be used by `ClassWithContextFinder`
    public let iterator: StackIterator

    // MARK: Methods

    /// Constructor
    ///
    /// - Parameter iterator: A `StackIterator` is to be used by `ClassWithContextFinder`
    public init(iterator: StackIterator = DefaultStackIterator()) {
        self.iterator = iterator
    }

    public func isTarget(_ viewController: ViewController, with context: Context) -> Bool {
        return viewController.rootView.context == context
    }

}

#endif
