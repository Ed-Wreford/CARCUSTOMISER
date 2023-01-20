//
//  ContentView.swift
//  CarCustomiser
//

//  Created by Ed Wreford on 15/01/2023.
//


import SwiftUI

struct ContentView: View {
    
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int = 0 {
        
        didSet {
            if selectedCar >= starterCars.cars.count {
                selectedCar  = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tiresPackage = false
    @State private var nitroBoostPackage = false
    @State private var godModePackage = false
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackageBinding }
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                }
            }
                
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackageBinding }
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                }
            }
                
        )
        
        let nitroBoostPackageBinding = Binding<Bool> (
            get: { self.nitroBoostPackageBinding }
            set: { newValue in
                self.nitroBoostPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 2
                } else {
                    starterCars.cars[selectedCar].acceleration += 2
                }
            }
                
        )
        
        let godModePackageBinding = Binding<Bool> (
            get: { self.godModePackageBinding }
            set: { newValue in
                self.godModePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    starterCars.cars[selectedCar].acceleration -= 1
                    starterCars.cars[selectedCar].topSpeed += 15
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    starterCars.cars[selectedCar].acceleration += 1
                    starterCars.cars[selectedCar].topSpeed += 15
                }
            }
                
        )
        
        Form {
            VStack(alignment: .leading, spacing: 20) {
                Text("\(starterCars.cars[selectedCar].displayStats())")
                    .foregroundColor(Color.black)
                
                Button("Next Car", action: {
                    selectedCar += 1
                    
                })
            }
            Section {
                Toggle("Exhaust package (Cost: 500)", isOn: exhaustPackageBinding)
                Toggle("Tires package (Cost: 500)", isOn: tiresPackageBinding)
                Toggle("Nitro boost package (Cost: 500)", isOn: nitroBoostPackageBinding)
                Toggle("God package (Cost: 1000)", isOn: godModePackageBinding)
            }
        }
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
