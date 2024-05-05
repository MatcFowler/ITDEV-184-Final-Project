//
//  IngredientsDropDownView.swift
//  CookEZ
//
//  Created by Admin on 4/6/24.
//

import UIKit
import SwiftUI

struct IngredientsDropDownView: View {
    var onClose: () -> Void // Closure to notify parent when "Close" button is tapped
    @State private var selectedTheme = "Dark"
    
    let measurements = ["Tbs", "ts", "Cup", "Pound", "Pinch"]
    @State private var title = ""
    //        var body: some View {
    //            VStack {
    //                Text("This is the bottom sheet")
    //                    .font(.title)
    //                    .padding()
    //
    //                Button("Close") {
    //                    onClose() // Call the closure when "Close" button is tapped
    //                }
    //                .padding()
    //            }
    //            .background(Color.white)
    //            .cornerRadius(10)
    //            .frame(maxWidth: .infinity, maxHeight: .infinity)
    //            .padding()
    //            .shadow(radius: 5)
    //            .edgesIgnoringSafeArea(.all)
    //        }
    
    var body: some View {
        NavigationView{
            Form{
                Picker("Appearance", selection: $selectedTheme){
                    ForEach(measurements, id: \.self){
                        Text($0)
                    }
                }.pickerStyle(.wheel)
                
            }
            .background(Color.appForeground)
                .tint(Color.appMain)
        }
    }
}
