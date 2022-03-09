//
//  ContentView.swift
//  2ndPractical
//
//  Created by user215333 on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Luksofors App")
            .padding()
        
        HStack {
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
