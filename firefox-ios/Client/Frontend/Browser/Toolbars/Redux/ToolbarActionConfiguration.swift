// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/

import Foundation

struct ToolbarActionConfiguration: Equatable, FeatureFlaggable {
    enum ActionType {
        case back
        case forward
        case home
        case newTab
        case search
        case tabs
        case menu
        case qrCode
        case share
        case reload
        case stopLoading
        case trackingProtection
        case locationView
        case readerMode
        case dataClearance
        case cancelEdit
    }

    var actionType: ActionType
    var actionLabel: String?
    var iconName: String?
    var badgeImageName: String?
    var maskImageName: String?
    var numberOfTabs: Int?
    var isFlippedForRTL = false
    var isEnabled: Bool
    var isSelected = false
    var hasCustomColor = false
    var largeContentTitle: String?
    var contextualHintType: String?
    var a11yLabel: String
    var a11yHint: String?
    var a11yId: String
    var a11yCustomActionName: String?

    func canPerformLongPressAction(isShowingTopTabs: Bool?) -> Bool {
        return actionType == .back ||
               actionType == .forward ||
               actionType == .reload ||
               actionType == .newTab ||
               actionType == .readerMode ||
               (actionType == .tabs && isShowingTopTabs == false)
    }
}
