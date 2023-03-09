//
//  JokeView.swift
//  Dad jokes
//
//  Created by Balsa Komnenovic on 9.3.23..
//

import SwiftUI

struct JokeView: View {
    @State private var jokeString = "No Joke Available"
    @State private var fetching = false
    @AppStorage("jokeType") var jokeType: JokeType = .dadJoke
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("dad")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(8)
                VStack {
                    ForEach(JokeType.allCases, id: \.self) { item in
                        Button {
                            jokeType = item
                            Task {
                                await getJoke(jokeType.type)
                            }
                        } label: {
                            Text(item.rawValue)
                                .foregroundColor(item == jokeType ? .red : Color.primary)
                        }
                    }
                }
                .frame(height: 130)
            }
            if fetching {
                ProgressView()
            } else {
                VStack {
                    Text(jokeString)
                        .minimumScaleFactor(0.5)
                    HStack {
                        Spacer()
                        Button {
                            let pasteBoard = NSPasteboard.general
                            pasteBoard.clearContents()
                            pasteBoard.setString(jokeString, forType: NSPasteboard.PasteboardType.string)
                        } label: {
                            Text("Copy")
                        }
                    }
                }
            }
            Spacer()
        }
        .padding()
        .task {
            await getJoke(jokeType.type)
        }
    }
    
    func getJoke(_ type: String) async {
        let url = "https://jokes.guyliangilsing.me/retrieveJokes.php?type=\(type)"
        let apiService = APIService(urlString: url)
        fetching.toggle()
        defer {
            fetching.toggle()
        }
        do {
            let joke: Joke = try await apiService.getJSON()
            jokeString = joke.joke
        } catch {
            jokeString = error.localizedDescription
        }
    }
}

struct JokeView_Previews: PreviewProvider {
    static var previews: some View {
        JokeView()
            .frame(width: 225, height: 255)
    }
}
