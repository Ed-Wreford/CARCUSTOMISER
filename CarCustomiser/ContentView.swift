//
//  ContentView.swift
//  CarCustomiser
//

//  Created by Ed Wreford on 15/01/2023.
//


import SwiftUI

struct ContentView: View {
    
    let starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar  = 0
            }
        }
        
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("\(starterCars.cars[selectedCar].displayStats())")
                .foregroundColor(Color.black)
            
            Button("Next Car", action: {
                selectedCar += 1
                
                //selectedCar = Int.random(in: 0 ..< self.starterCars.cars.count)
            })
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
