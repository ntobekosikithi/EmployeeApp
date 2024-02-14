//
//  MessageDisplayerHelper.swift
//  EmployeeApp
//
//  Created by ns90840 on 2024/02/10.
//

import UIKit
import SwiftMessages

class ErrorDisplayHelper {
    @MainActor static func showError(message: String) {
        var config = SwiftMessages.defaultConfig
        config.presentationStyle = .top
        config.presentationContext = .window(windowLevel: UIWindow.Level.statusBar)
        config.dimMode = .gray(interactive: true)

        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(.error)
        view.configureDropShadow()

        view.button?.isHidden = true
        view.configureContent(title: "Error", body: message)

        SwiftMessages.show(config: config, view: view)
    }
}
