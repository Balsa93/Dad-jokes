//
//  TypeSelectionView.swift
//  Dad jokes WatchKit Watch App
//
//  Created by Balsa Komnenovic on 10.3.23..
//

import SwiftUI

struct TypeSelectionView: View {
    @AppStorage("jokeType") var jokeType: JokeType = .dadJoke
    
    var body: some View {
        List {
            ForEach(JokeType.allCases, id: \.self) { item in
                Button {
                    jokeType = item
                } label: {
                    Text(item.rawValue)
                }
                .padding(.horizontal)
                .listItemTint(item == jokeType ? .red : Color.init(red: 0.9, green: 0.9, blue: 0.9, opacity: 0.3))
            }
        }
        .padding()
        .navigationTitle("Joke Types")
    }
}

struct TypeSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TypeSelectionView()
    }
}
