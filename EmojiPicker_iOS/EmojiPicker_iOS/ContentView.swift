//
//  ContentView.swift
//  emoji_picker
//
//  Created by rishabh on 6/6/23.
//

import SwiftUI

// Value Type String so it can be displayed in a label
// Protocol CaseIterable - allows looping through options for the Picker
enum Emoji: String, CaseIterable {
    case 😀, 🥳, 🥸, 👻
}

struct ContentView: View {
    // State and Bindings are similar - tell View to update when data has changed
    @State var selection: Emoji = .😀
    
    var body: some View {
        
        // Deprecated - use NavigationStack or NavigationSplitView instead - ok for this project
        NavigationView {
            // Vertical Stack container with 2 elements inside
            VStack {
                
                // 1. Text Label (shows current selection's raw value (string representation of emoji from enum), used font modifier
                Text(selection.rawValue).font(.system(size: 150))
                
                // 2. Picker (title, passed in state var as binding with $, loop through every case in enum where id is self (unique identifier), update Text Label with the emoji raw value
                // if you change the enum, then the picker will change too
                Picker("Select Emoji", selection: $selection) {
                    ForEach(Emoji.allCases, id: \.self) { emoji in
                        Text(emoji.rawValue)
                    }
                }
                // Picker styling
                .pickerStyle(.segmented)
            }
            .navigationTitle("Emoji Picker")
            .padding()
        }
        
    }
}

// ContentView in XCode
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
