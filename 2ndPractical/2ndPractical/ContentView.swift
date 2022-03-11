//
//  ContentView.swift
//  2ndPractical
//
//  Created by user215333 on 3/9/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var timeRemaining = 0
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isGreen = true
    
    @State private var counter = 0
    
    var trafficLightColors: [Color] = [.red, .orange, .green]
    
    @State private var date = Date()
    
    @State var darkGreen = Color(red: 0 / 255, green: 100 / 255, blue: 0 / 255)
    @State var darkRed = Color(red: 139 / 255, green: 0 / 255, blue: 0 / 255)
    @State var darkOrange = Color(red: 139 / 255, green: 64 / 255, blue: 0 / 255)
    
    
    @State var currentTrafficLightRed = Color.gray
    @State var currentTrafficLightOrange = Color.gray
    @State var currentTrafficLightGreen = Color.gray
    
    func dateToString(chosenDate selectedDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.string(from: selectedDate)
        return date
    }
    
    func getHoursFromDate(chosenDate selectedDate: Date) -> Int {
        let hour = Calendar.current.component(.hour, from: selectedDate)
        return hour
    }
    
    func checkTimeOfDay(chosdenDate selectedHour: Int) {
        if (selectedHour >= 6 && selectedHour <= 24) {
            timeRemaining = 120
            currentTrafficLightRed = darkRed
            currentTrafficLightOrange = darkOrange
            currentTrafficLightGreen = Color.green
        } else {
            timeRemaining = 0
            currentTrafficLightRed = darkRed
            currentTrafficLightOrange = darkOrange
            currentTrafficLightGreen = darkGreen
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
            .onChange(of: date) { [date] newDate in
                checkTimeOfDay(chosdenDate: getHoursFromDate(chosenDate: date))
            }
        
        DatePicker(selection: $date, label: {})
            .datePickerStyle(CompactDatePickerStyle())
            .clipped()
            .frame(maxHeight: 150)
            .labelsHidden()
            .onAppear { checkTimeOfDay(chosdenDate: getHoursFromDate(chosenDate: date)) }
    
        VStack {
            
            Circle()
                .fill(currentTrafficLightRed)
                .frame(width: 100, height: 100)
            Circle()
                .fill(currentTrafficLightOrange)
                .frame(width: 100, height: 100)
            Circle()
                .fill(currentTrafficLightGreen)
                .frame(width: 100, height: 100)
            Text("Time: \(timeRemaining)").onReceive(timer) {
                time in
                if timeRemaining > 0 {
                    timeRemaining -= 1
                    if(currentTrafficLightGreen == Color.green && timeRemaining == 0) {
                        isGreen = false
                        timeRemaining = 60
                        currentTrafficLightRed = darkRed
                        currentTrafficLightOrange = Color.orange
                        currentTrafficLightGreen = darkGreen
                    } else if (currentTrafficLightOrange == Color.orange && timeRemaining == 0){
                        if (isGreen == true) {
                            currentTrafficLightRed = darkRed
                            currentTrafficLightOrange = darkOrange
                            currentTrafficLightGreen = Color.green
                            timeRemaining = 180
                        }
                        if (isGreen == false) {
                            currentTrafficLightRed = Color.red
                            currentTrafficLightOrange = darkOrange
                            currentTrafficLightGreen = darkGreen
                            timeRemaining = 120
                        }
                    }
                    if(currentTrafficLightRed == Color.red && timeRemaining == 0) {
                        isGreen = true
                        timeRemaining = 60
                        currentTrafficLightRed = darkRed
                        currentTrafficLightOrange = Color.orange
                        currentTrafficLightGreen = darkGreen
                    } else if (currentTrafficLightOrange == Color.orange && timeRemaining == 0){
                        if (isGreen == true) {
                            currentTrafficLightRed = darkRed;              currentTrafficLightOrange = darkOrange
                            currentTrafficLightGreen = Color.green
                            timeRemaining = 180
                        }
                        if (isGreen == false) {
                            currentTrafficLightRed = Color.red
                            currentTrafficLightOrange = darkOrange
                            currentTrafficLightGreen = darkGreen
                            timeRemaining = 120
                        }
                }
            }
            }
                .padding(.horizontal, 20)
                .padding(.vertical, 5)
                .background(Capsule()
                                .fill(Color.gray)
                                .opacity(0.75)
                )
        }.background(RoundedRectangle(cornerRadius: 35, style: .continuous)
                        .fill(Color.black)
                        .frame(width: 170, height: 400)
                     )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
