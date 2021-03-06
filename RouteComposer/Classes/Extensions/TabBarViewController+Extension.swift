//
// RouteComposer
// TabBarViewController+Extension.swift
// https://github.com/ekazaev/route-composer
//
// Created by Eugene Kazaev in 2018-2020.
// Distributed under the MIT license.
//

#if os(iOS)

import Foundation
import UIKit

/// - The `UITabBarController` extension is to support the `ContainerViewController` protocol
extension UITabBarController: ContainerViewController {

    public var canBeDismissed: Bool {
        return viewControllers?.canBeDismissed ?? true
    }

}

#endif
