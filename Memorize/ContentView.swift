//
//  ContentView.swift
//  Memorize
//
//  Created by Yani Buchkov on 15.11.21.
//

import SwiftUI

struct ContentView: View {
    var emojis: Array<String> = [
        "🚕", "✈️", "🚁", "🚐", "🚛", "🚓", "🧳", "🏍",
        "🚀", "🏎", "⛴", "🛻", "🚝", "🚌", "🚂", "🚡",
        "🚇", "🚲", "🚃", "🚅", "⛵️", "🛫", "🚤", "🚍",
    ]
    @State var emojiCount = 24
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[..<emojiCount], id: \.self) { emoj in
                        CardView(content: emoj)
                            .aspectRatio(2/3, contentMode: .fit)
                        
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                remove
                Spacer()
                add
            }
            .font(.largeTitle)
            .padding(.horizontal)
            
        }
        .padding(.horizontal)
    }
    
    var remove: some View {
        Button {
            if emojiCount > 1 {
                emojiCount -= 1
            }
        } label: {
            Image(systemName: "minus.circle")

        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
                
        }
    }
}

struct CardView: View {
    @State var isFaceUp: Bool = true
    // "✈️"
    var content: String
    var body: some View {
        let shape = RoundedRectangle(cornerRadius: 20)
        ZStack {
            if isFaceUp {
                shape.fill().foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                shape.strokeBorder(lineWidth: 3.0)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}









































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)

    }
}


