//
//  ContentView.swift
//  GameOfLife
//
//  Created by Michael Stanziano on 6/20/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WorldView(world: .init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
