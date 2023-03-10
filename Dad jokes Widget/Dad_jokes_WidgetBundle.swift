//
//  Dad_jokes_WidgetBundle.swift
//  Dad jokes Widget
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import WidgetKit
import SwiftUI

@available(iOSApplicationExtension 16.1, *)
@main
struct Dad_jokes_WidgetBundle: WidgetBundle {
    var body: some Widget {
        Dad_jokes_Widget()
        Dad_jokes_WidgetLiveActivity()
    }
}
