//
//  BottomSheetview.swift
//  CookEZ
//
//  Created by Admin on 4/3/24.
//
import UIKit
import SwiftUI

struct FormView: View {
    
    @State private var isShowingIngredientsForm = false
    @State private var isShowingPrepStepsForm = false
    @State private var isShowingDirectionsForm = false
    @State private var isShowingAdditionalStepsForm = false
    var onClose: () -> Void // Closure to notify parent when "Close" button is tapped
    let ImagePresetText = ["Brownies","Spaggetti"]
    let ImagePreset = ["browniesrecipephoto","spaggetti","browniesrecipephoto","spaggetti","browniesrecipephoto","spaggetti","browniesrecipephoto","spaggetti",] // List of label titles
    
    @State private var recipeName = ""
    @State private var recipeAuthor = ""
    @State private var isSharedOnline: Bool = false
    
    @State private var recipeIngredients: String = ""
    @State private var recipePrepSteps: String = ""
    @State private var recipeDirections: String = ""
    @State private var recipeAdditionalInfo: String = ""
    

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
            VStack{
                Form{
                    Section{
                        TextField("Name of Recipe", text: $recipeName)
                            .multilineTextAlignment(.center)
                        .padding()
                        .border(Color.accentColor, width: 2)
                    } header: {
                        Text("Recipe Information")
                    }
                    Section{
                        ScrollView(.horizontal) {
                            HStack(spacing: 10) { // Adjust spacing between labels
                                ForEach(ImagePreset, id: \.self) { image in
                                    VStack{
                                        
                                        Text(ImagePresetText[0])
                                            .padding()
                                            .background(Color.appMain)
                                            .foregroundColor(.white)
                                            .cornerRadius(6)
                                        Image(image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 350, height: 230)
                                            .padding()
                                        
                                    }
                                }
                            }
                        }
                        .border(Color.accentColor, width: 2)
                    }
                    header: {
                        Text("Image Selector")
                    }
                    Section{
                        Button(action: {
                                            isShowingIngredientsForm = true
                                        }) {
                                            Text("Add Ingredients")
                                            .frame(width: 300, height: 25, alignment: .center)
                                            .padding()
                                            .border(Color.accentColor, width: 2)
                                            if isShowingIngredientsForm {
                                                NavigationLink(destination: IngredientsFormView(isShowingIngredientsForm: $isShowingIngredientsForm, recipeIngredients: $recipeIngredients), isActive: $isShowingIngredientsForm) {
                                                                   EmptyView()
                                                               }
                                                           }
                                        }
                        Text($recipeIngredients.wrappedValue)
                    } header: {
                        Text("Ingredients")
                    }
                    Section{
                        Button(action: {
                                            isShowingPrepStepsForm = true
                                        }) {
                                            Text("Add Preperation Steps")
                                            .frame(width: 300, height: 25, alignment: .center)
                                            .padding()
                                            .border(Color.accentColor, width: 2)
                                            if isShowingPrepStepsForm {
                                                NavigationLink(destination: PrepStepsFormView(isShowingPrepStepsForm: $isShowingPrepStepsForm, recipePrepSteps: $recipePrepSteps), isActive: $isShowingPrepStepsForm) {
                                                                   EmptyView()
                                                               }
                                                           }
                                        }
                        Text($recipePrepSteps.wrappedValue)
                    } header: {
                        Text("Prep Steps")
                    }
                    Section{
                        Button(action: {
                            isShowingDirectionsForm = true
                                        }) {
                                            Text("Add Directions")
                                            .frame(width: 300, height: 25, alignment: .center)
                                            .padding()
                                            .border(Color.accentColor, width: 2)
                                            if isShowingDirectionsForm {
                                                NavigationLink(destination: DirectionsFormView(isShowingDirectionsForm: $isShowingDirectionsForm, recipeDirections: $recipeDirections), isActive: $isShowingDirectionsForm) {
                                                                   EmptyView()
                                                               }
                                                           }
                                        }
                        Text($recipeDirections.wrappedValue)
                    } header: {
                        Text("Directions")
                    }
                    Section{
                        Button(action: {
                            isShowingAdditionalStepsForm = true
                                        }) {
                                            Text("Add Additional Information")
                                            .frame(width: 300, height: 25, alignment: .center)
                                            .padding()
                                            .border(Color.accentColor, width: 2)
                                            if isShowingAdditionalStepsForm {
                                                NavigationLink(destination: AdditionalInfoFormView(isShowingAdditionalStepsForm: $isShowingAdditionalStepsForm, recipeAdditionalInfo: $recipeAdditionalInfo), isActive: $isShowingAdditionalStepsForm) {
                                                                   EmptyView()
                                                               }
                                                           }
                                        }
                        Text($recipeAdditionalInfo.wrappedValue)
                    } header: {
                        Text("Additional Information")
                    }
                    Section{
                        Toggle("Share Globally", isOn: $isSharedOnline)
                    }
                    Section{
                        HStack {
                            Spacer()
                            Button("Close Form") {
                                onClose()
                            }
                        }
                    }
                    
                }
                .tint(Color.appMain)
                .navigationBarTitle("Recipe Creator")
            }
        }
    }
    
    struct IngredientsFormView: View {
        @State private var selectedTheme = "Dark"
        
        let measurements = ["None","Tablespoons", "Teaspoons", "Cup", "Pound", "Pinch"]
        
        @State private var selectedMeasurement = "Tablespoons"
        @State private var ingredientsText = ""
        @State private var selectedNumber = 1
        
        @Binding var isShowingIngredientsForm: Bool
        @Binding var recipeIngredients: String
        
        var body: some View {
            NavigationView{
                Form{
                    Section{
                        VStack {
                            Text("Measurement: \(selectedMeasurement)")
                                .frame(width: 250, height: 30, alignment: .center)
                            Picker("Appearance", selection: $selectedMeasurement){
                                ForEach(measurements, id: \.self){
                                    Text($0)
                                }
                            }.pickerStyle(.wheel)
                                .frame(height: 100)
                        }
                        .border(Color(.appMain), width: 3)
                    }
                    Section{
                        VStack {
                                    Text("Ingredient Amount: \(selectedNumber)")
                                .frame(width: 250, height: 30, alignment: .center)
                                    Picker("Ingredient Amount", selection: $selectedNumber) {
                                        ForEach(1...100, id: \.self) { number in
                                            Text("\(number)")
                                        }
                                    }
                                    .pickerStyle(.wheel)
                                    .frame(height: 100)
                                }
                        .border(Color(.appMain), width: 3)
                    }
                    Section{
                        VStack {
                            Text("Enter Your Ingredient")
                                .frame(width: 250, height: 30, alignment: .center)
                            TextEditor(text: $ingredientsText)
                                .frame(height: 100)
                                .lineLimit(5)
                                
                        }
                        .border(Color(.appMain), width: 3)
                    }
                
                    Button(action: {
                        if(ingredientsText.isEmpty){}else if(selectedMeasurement == "None"){
                            recipeIngredients += "\n-" + selectedNumber.description + " " + ingredientsText
                        }else{
                            recipeIngredients += "\n-" + selectedNumber.description + " " + selectedMeasurement + " " + ingredientsText
                        }
                        isShowingIngredientsForm = false
                                }) {
                                    Text("Enter Ingredients")
                                        .frame(width: 180, height: 30, alignment: .center)
                                }
                }
                .tint(Color.appMain)
                .navigationBarTitle("Enter Ingredient")
            }
        }
    }
    struct PrepStepsFormView: View {
        @State private var selectedTheme = "Dark"
        
        let measurements = ["Tablespoons", "Teaspoons", "Cup", "Pound", "Pinch"]
        
        @State private var selectedMeasurement = "Tablespoons"
        @State private var ingredientsText = ""
        @State private var selectedNumber = 1
        
        @Binding var isShowingPrepStepsForm : Bool
        @Binding var recipePrepSteps: String
        
        var body: some View {
            NavigationView{
                Form{
                    Section{
                        TextField("Enter Your Prep Steps",text: $ingredientsText)
                            .frame(height: 200)
                    }
                
                    Button(action: {
                        recipePrepSteps += "\n-" + ingredientsText
                        isShowingPrepStepsForm = false
                                }) {
                                    Text("Enter Prep Steps")
                                }
                }
                .tint(Color.appMain)
                .navigationBarTitle("Enter Prep Steps")
            }
        }
    }
    struct DirectionsFormView: View {
        @State private var selectedTheme = "Dark"
        
        let measurements = ["Tablespoons", "Teaspoons", "Cup", "Pound", "Pinch"]
        
        @State private var selectedMeasurement = "Tablespoons"
        @State private var ingredientsText = ""
        @State private var selectedNumber = 1
        
        @Binding var isShowingDirectionsForm: Bool
        @Binding var recipeDirections: String
        
        var body: some View {
            NavigationView{
                Form{
                    Section{
                        TextField("Enter Your Directions",text: $ingredientsText)
                            .frame(height: 200)
                    }
                
                    Button(action: {
                        recipeDirections += "\n-" + ingredientsText
                        isShowingDirectionsForm = false
                                }) {
                                    Text("Enter Directions")
                                }
                }
                .tint(Color.appMain)
                .navigationBarTitle("Enter Directions")
            }
        }
    }
    struct AdditionalInfoFormView: View {
        @State private var selectedTheme = "Dark"
        
        let measurements = ["Tablespoons", "Teaspoons", "Cup", "Pound", "Pinch"]
        
        @State private var selectedMeasurement = "Tablespoons"
        @State private var ingredientsText = ""
        @State private var selectedNumber = 1
        
        @Binding var isShowingAdditionalStepsForm: Bool
        @Binding var recipeAdditionalInfo: String
        
        var body: some View {
            NavigationView{
                Form{
                    
                    Section{
                        TextField("Enter Your Additional Steps",text: $ingredientsText)
                            .frame(height: 200)
                    }
                    
                    Button(action: {
                        recipeAdditionalInfo += "\n-" + ingredientsText
                        isShowingAdditionalStepsForm = false
                    }) {
                        Text("Enter Additional Steps")
                    }
                }
                .padding(1)
                .background(Color.appForeground)
                .tint(Color.appMain)
                .navigationBarTitle("Enter Additional Steps")
            }
        }
    }
}
