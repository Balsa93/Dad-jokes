//
//  Dad_jokes_WidgetLiveActivity.swift
//  Dad jokes Widget
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import ActivityKit
import WidgetKit
import SwiftUI

struct Dad_jokes_WidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var value: Int
    }
    
    // Fixed non-changing properties about your activity go here!
    var name: String
}

@available(iOSApplicationExtension 16.1, *)
struct Dad_jokes_WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: Dad_jokes_WidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)
            
        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T")
            } minimal: {
                Text("Min")
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

struct Dad_jokes_WidgetLiveActivity_Previews: PreviewProvider {
    static let attributes = Dad_jokes_WidgetAttributes(name: "Me")
    static let contentState = Dad_jokes_WidgetAttributes.ContentState(value: 3)
    
    static var previews: some View {
        if #available(iOSApplicationExtension 16.2, *) {
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.compact))
                .previewDisplayName("Island Compact")
        } else {
            // Fallback on earlier versions
        }
        if #available(iOSApplicationExtension 16.2, *) {
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.expanded))
                .previewDisplayName("Island Expanded")
        } else {
            // Fallback on earlier versions
        }
        if #available(iOSApplicationExtension 16.2, *) {
            attributes
                .previewContext(contentState, viewKind: .dynamicIsland(.minimal))
                .previewDisplayName("Minimal")
        } else {
            // Fallback on earlier versions
        }
        if #available(iOSApplicationExtension 16.2, *) {
            attributes
                .previewContext(contentState, viewKind: .content)
                .previewDisplayName("Notification")
        } else {
            // Fallback on earlier versions
        }
    }
}
