//
//  AppTabView.swift
//  Dad jokes WatchKit Watch App
//
//  Created by Balsa Komnenovic on 10.3.23..
//

import SwiftUI

struct AppTabView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            WatchKitJokeView()
                .tag(0)
            TypeSelectionView()
                .tag(1)
        }
    }
}

struct AppTabView_Previews: PreviewProvider {
    static var previews: some View {
        AppTabView()
    }
}
