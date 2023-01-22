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
    @State private var remainingTime = 30
    @State private var nextCarEnabled: Bool = true
    
    var exhaustPackageEnabled: Bool {
        exhaustPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var tiresPackageEnabled: Bool {
        tiresPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var nitroBoostPackageEnabled: Bool {
        nitroBoostPackage ? true : remainingFunds >= 500 ? true : false
    }
    
    var godModePackageEnabled: Bool {
        godModePackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        let exhaustPackageBinding = Binding<Bool> (
            get: { self.exhaustPackage },
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
            get: { self.tiresPackage },
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
            get: { self.nitroBoostPackage },
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
            get: { self.godModePackage },
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
            Text("\(remainingTime)")
                .onReceive(timer) { _ in
                    if self.remainingTime > 0 {
                        self.remainingTime -= 1
                    }
                    if remainingTime == 0 {
                        remainingFunds = 0
                        exhaustPackage = false
                        tiresPackage = false
                        nitroBoostPackage = false
                        godModePackage = false
                        nextCarEnabled = false
                    }
                }
                .foregroundColor(.red)
            Form {
                VStack(alignment: .leading, spacing: 20) {
                    Text("\(starterCars.cars[selectedCar].displayStats())")
                        .foregroundColor(Color.black)
                    
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                    .disabled(!nextCarEnabled)
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
        
    
    }
    
    func resetDisplay() {
        
        remainingFunds = 1000
        exhaustPackage = false
        tiresPackage = false
        nitroBoostPackage = false
        godModePackage = false
        starterCars = StarterCars()
        
    }
    
    
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            
        }
    }
}
