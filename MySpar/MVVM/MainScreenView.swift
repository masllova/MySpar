//
//  MainScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}