//
//  FilterCell.swift
//  CookEZ
//
//  Created by Admin on 3/30/24.
//


import UIKit
import SwiftUI

struct FilterCell: View {
    let labelTitles = ["Appetizers", "Barbeque", "Steak", "Desserts", "Breakfast", "Bacon", "Burgers", "Salads", "American"] // List of label titles
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 10) { // Adjust spacing between labels
                ForEach(labelTitles, id: \.self) { title in
                    Text(title)
                        .padding(5)
                        .background(Color.appMain)
                        .foregroundColor(.white)
                        .cornerRadius(18)
                }
            }
            .padding()
        }
        
    }
}
