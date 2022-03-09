//
//  ContentView.swift
//  2ndPractical
//
//  Created by user215333 on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var trafficLightColors: [Color] = [.red, .orange, .green]
    
    @State var currentTrafficLight = Color.red
    
    var body: some View {
        
        Text("Luksofors App")
            .padding()
        
        VStack {
            
            DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: {})
                .datePickerStyle(CompactDatePickerStyle())
                .clipped()
                .labelsHidden()
            Circle()
                .fill(Color.red)
                .frame(width: 100, height: 100)
            Circle()
                .fill(Color.orange)
                .frame(width: 100, height: 100)
            Circle()
                .fill(Color.green)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
