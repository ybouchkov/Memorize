//
//  ContentView.swift
//  Memorize
//
//  Created by Yani Buchkov on 15.11.21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis: Array<String> = [] // initial state
    @State var emojiCount = 0
    
    var body: some View {
        VStack {
            Text("Memorize!")
                .font(.largeTitle)
            ScrollView {
                if !emojis.isEmpty {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                        ForEach(emojis[..<emojiCount], id: \.self) { emoj in
                            CardView(content: emoj)
                                .aspectRatio(2/3.5, contentMode: .fit)
                            
                        }
                    }
                } else {
                    VStack {
                        Image(systemName: "theatermasks.fill")
                        Text("No theme has been choosen!")
                    }.font(.largeTitle)
                }
            }
            .foregroundColor(.red)
            Text("Choose one the theme: V / F / W")
            Spacer()
            HStack {
                remove
                Spacer()
                vehicles
                Spacer()
                food
                Spacer()
                weather
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
            VStack {
                Image(systemName: "minus.circle")
                Text("Remove").font(.system(size: 9)).fontWeight(.light)
            }

        }
    }
    
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            VStack {
                Image(systemName: "plus.circle")
                Text("Add").font(.system(size: 9)).fontWeight(.light)
            }
                
        }
    }
    
    var vehicles: some View {
        Button {
            emojiCount = 8
            emojis = [
                "🚕", "✈️", "🚁", "🚐", "🚛", "🚓", "🧳", "🏍",
                "🚀", "🏎", "⛴", "🛻", "🚝", "🚌", "🚂", "🚡",
                "🚇", "🚲", "🚃", "🚅", "⛵️", "🛫", "🚤", "🚍",
            ].shuffled()
        } label: {
            VStack {
                Image(systemName: "car.circle")
                Text("Vehicles").font(.system(size: 9)).fontWeight(.light)
            }
        }
    }
    
    var food: some View {
        Button {
            emojiCount = 12
            emojis = [
                "🍔", "🌭", "🌮", "🌯", "🥙", "🥗", "🥪", "🍕",
                "🍟", "🍖", "🍗", "🥓", "🍱", "🥘", "🧆", "🍲",
                "🍛", "🍜", "🍝", "🍣", "🍤", "🍿", "🥟", "🍳",
            ].shuffled()
        } label: {
            VStack {
                Image(systemName: "pills.circle")
                Text("Food").font(.system(size: 9)).fontWeight(.light)
            }
        }
    }
    
    var weather: some View {
        Button {
            emojiCount = 15
            emojis = [
                "🌡", "☁️", "☀️", "🌤", "🌥", "🌦", "🌧", "🌨",
                "⛈", "🌩", "⚡️", "☔️", "☂️", "❄️", "🌪", "💨",
                "🌈", "🤢", "🤮", "🤧", "😷", "🤕", "☃️", "🤒",
            ].shuffled()
        } label: {
            VStack {
                Image(systemName: "sun.max.circle")
                Text("Weather").font(.system(size: 9)).fontWeight(.light)
            }
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


