//
//  MainScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            TabBarLabels.main.label
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
