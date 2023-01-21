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
    @State private var remainingFunds = 1000
    
    var exhaustPackageEnabled: Bool {
        if remainingFunds - 500 >= 0 {
            return true
        }
        else {
            return false
        }
    }
    
    var tiresPackageEnabled: Bool {
        if remainingFunds - 500 >= 0 {
            return true
        }
        else {
            return false
        }
    }
    
    var nitroBoostPackageEnabled: Bool {
        if remainingFunds - 500 >= 0 {
            return true
        }
        else {
            return false
        }
    }
    
    var godModePackageEnabled: Bool {
        if remainingFunds - 1000 >= 0 {
            return true
        }
        else {
            return false
        }
    }
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage }
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds  += 500
                }
            }
            
        )
        
        let tiresPackageBinding = Binding<Bool> (
            get: { self.tiresPackage }
            set: { newValue in
                self.tiresPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds  += 500
                }
            }
            
        )
        
        let nitroBoostPackageBinding = Binding<Bool> (
            get: { self.nitroBoostPackage }
            set: { newValue in
                self.nitroBoostPackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].acceleration -= 2
                    remainingFunds -= 500
                } else {
                    starterCars.cars[selectedCar].acceleration += 2
                    remainingFunds  += 500
                }
            }
            
        )
        
        let godModePackageBinding = Binding<Bool> (
            get: { self.godModePackage }
            set: { newValue in
                self.godModePackage = newValue
                if newValue == true {
                    starterCars.cars[selectedCar].handling += 2
                    starterCars.cars[selectedCar].acceleration -= 1
                    starterCars.cars[selectedCar].topSpeed += 15
                    remainingFunds -= 1000
                } else {
                    starterCars.cars[selectedCar].handling -= 2
                    starterCars.cars[selectedCar].acceleration += 1
                    starterCars.cars[selectedCar].topSpeed += 15
                    remainingFunds  += 1000
                }
            }
            
        )
        VStack {
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                        .foregroundColor(Color.black)
                    
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                }
                Section {
                    Toggle("Exhaust package (Cost: 500)", isOn: exhaustPackageBinding)
                        .disabled(!exhaustPackageEnabled)
                    Toggle("Tires package (Cost: 500)", isOn: tiresPackageBinding)
                        .disabled(!tiresPackageEnabled)
                    Toggle("Nitro boost package (Cost: 500)", isOn: nitroBoostPackageBinding)
                        .disabled(!nitroBoostPackageEnabled)

                    Toggle("God package (Cost: 1000)", isOn: godModePackageBinding)
                        .disabled(!godModePackageEnabled)

                }
            }
            Text("Remaining Funds: \(remainingFunds)")
                .foregroundColor(.red)
                .baselineOffset(20)
        }
        
     func resetDisplay()
        
        
        
    }
    
    
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
