//
//  ContentView.swift
//  CarCustomiser
//
//
//  Created by Ed Wreford on 15/01/2023.
//
//

import SwiftUI

struct ContentView: View {
    
    let car = Car(make: "Mazda", model: "MX-5", topSpeed: 125, acceleration: 7.7, handling: 5)
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Make: \(car.make)")
                    .foregroundColor(Color.red)
            Text("Model: \(car.model)")
                    .foregroundColor(Color.red)
            Text("Top Speed: \(car.topSpeed)mph")
                    .foregroundColor(Color.red)
            Text("Acceleration (0-60): \(car.acceleration)s")
                    .foregroundColor(Color.red)
            Text("Handling: \(car.handling)")
                    .foregroundColor(Color.red)
                
            }
            .padding(1.0)
        }
    }
    
    


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
    }
}
