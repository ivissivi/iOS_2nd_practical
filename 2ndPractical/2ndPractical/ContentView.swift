//
//  ContentView.swift
//  2ndPractical
//
//  Created by user215333 on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    
    var trafficLightColors: [Color] = [.red, .orange, .green]
    
    @State private var date = Date()
    
    @State var currentTrafficLight = Color.gray
    
    func dateToString(chosenDate selectedDate: Date) -> String {
        var dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        var date = dateFormatter.string(from: selectedDate)
        return date
    }
    
    func getHoursFromDate(chosenDate selectedDate: Date) -> Int {
        var hour = Calendar.current.component(.hour, from: selectedDate)
        return hour
    }
    
    func checkTimeOfDay(chosdenDate selectedHour: Int) {
        if (selectedHour >= 6 && selectedHour <= 24) {
            currentTrafficLight = Color.green
        } else {
            currentTrafficLight = Color.red
        }
    }
    
    var body: some View {
        
        Text("Luksofors App")
            .padding()
            .font(.largeTitle)
        
        Text("Selected: " + dateToString(chosenDate: date))
            .padding()
        
        Text("Current hour: " + String(getHoursFromDate(chosenDate: date)))
            .padding()
        
        Button("Run traffic light") {
            checkTimeOfDay(chosdenDate: getHoursFromDate(chosenDate: date))
        }

        VStack {
            
            DatePicker(selection: $date, label: {})
                .datePickerStyle(CompactDatePickerStyle())
                .clipped()
                .frame(maxHeight: 150)
                .labelsHidden()
            Circle()
                .fill(currentTrafficLight)
                .frame(width: 100, height: 100)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
