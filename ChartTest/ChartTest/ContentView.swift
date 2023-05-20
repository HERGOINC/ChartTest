
import SwiftUI
import Charts

struct HoursOfSleep:Identifiable {
    var type:String
    var date: Date
    var hours: Double
    var id:UUID = UUID()
    
    init(type:String, month: Int, hours: Double) {
        let calendar = Calendar.autoupdatingCurrent
        self.type = type
        self.date = calendar.date(from: DateComponents(year: 2023, month: month))!
        self.hours = hours
    }
}
struct ContentView: View {
    
    var data: [HoursOfSleep] = [
        HoursOfSleep(type:"sleep", month: 1, hours: 74),
        HoursOfSleep(type:"sleep",month: 2, hours: 99),
        HoursOfSleep(type:"sleep",month: 3, hours: 49),
        HoursOfSleep(type:"sleep",month: 4, hours: 29),
        HoursOfSleep(type:"sleep",month: 5, hours: 19),
        HoursOfSleep(type:"sleep",month: 6, hours: 79),
        HoursOfSleep(type:"sleep",month: 7, hours: 62),
        
        HoursOfSleep(type:"awake", month: 1, hours: 24),
        HoursOfSleep(type:"awake",month: 2, hours: 29),
        HoursOfSleep(type:"awake",month: 3, hours: 29),
        HoursOfSleep(type:"awake",month: 4, hours: 19),
        HoursOfSleep(type:"awake",month: 5, hours: 9),
        HoursOfSleep(type:"awake",month: 6, hours: 29),
        HoursOfSleep(type:"awake",month: 7, hours: 32),
    ]
    
    var body: some View {
        Chart(data) {
            LineMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sleep", $0.hours)
                //            ForEach(data) { shape in
                //                LineMark(
                //                    x: .value("Month", shape.date),
                //                                y: .value("Hours of Sunshine", shape.hoursOfSunshine)
                //                )
                //
                //            }
            ).foregroundStyle(by: .value("Type", $0.type))
        }
        //                    .chartForegroundStyleScale([
        //            "sleep": .green, "Purple": .purple, "Pink": .pink, "Yellow": .yellow
        //        ])
    }
}


struct ContentView2: View {
    
    var data: [HoursOfSleep] = [
        HoursOfSleep(type:"sleep", month: 1, hours: 74),
        HoursOfSleep(type:"sleep",month: 2, hours: 99),
        HoursOfSleep(type:"sleep",month: 3, hours: 49),
        HoursOfSleep(type:"sleep",month: 4, hours: 29),
        HoursOfSleep(type:"sleep",month: 5, hours: 19),
        HoursOfSleep(type:"sleep",month: 6, hours: 79),
        HoursOfSleep(type:"sleep",month: 7, hours: 62),
        
        HoursOfSleep(type:"awake", month: 1, hours: 24),
        HoursOfSleep(type:"awake",month: 2, hours: 29),
        HoursOfSleep(type:"awake",month: 3, hours: 29),
        HoursOfSleep(type:"awake",month: 4, hours: 19),
        HoursOfSleep(type:"awake",month: 5, hours: 9),
        HoursOfSleep(type:"awake",month: 6, hours: 29),
        HoursOfSleep(type:"awake",month: 7, hours: 32),
    ]
    
    var body: some View {
        Chart(data) {
            BarMark(
                x: .value("Month", $0.date),
                y: .value("Hours of Sleep", $0.hours)
                
            ).foregroundStyle(by: .value("Type", $0.type))
        }
        .chartForegroundStyleScale([
            "sleep": .green, "awake": .purple
        ])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
