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
    
    var imageWidth: CGFloat {
        #if os(macOS)
        return 60
        #else
        return 120
        #endif
    }
    
    var font: Font {
        #if os(macOS)
        return .body
        #else
        return .title
        #endif
    }
    
    var frameWidth: CGFloat {
        #if os(macOS)
        return 205
        #else
        return min(UIScreen.main.bounds.size.width - 20, 600)
        #endif
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Image("dad")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: imageWidth)
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
                        #if os(macOS)
                        .cornerRadius(6)
                        #else
                        .buttonStyle(.bordered)
                        .background(Color(.systemGray5))
                        .cornerRadius(12)
                        #endif
                    }
                }
            }
            if fetching {
                ProgressView()
            } else {
                VStack {
                    Text(jokeString)
                        .font(font)
                        .minimumScaleFactor(0.5)
                    HStack {
                        Spacer()
                        Button {
                            #if os(macOS)
                            let pasteBoard = NSPasteboard.general
                            pasteBoard.clearContents()
                            pasteBoard.setString(jokeString, forType: NSPasteboard.PasteboardType.string)
                            #else
                            let pasteBoard = UIPasteboard.general
                            pasteBoard.string = jokeString
                            #endif
                        } label: {
                            Text("Copy")
                        }
                        .buttonStyle(.borderedProminent)
                    }
                }
                .frame(width: frameWidth)
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
        #if os(iOS)
        JokeView()
        #else
        JokeView()
            .frame(width: 225, height: 255)
        #endif
    }
}
