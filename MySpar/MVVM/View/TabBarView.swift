//
//  TabBarView.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0
    var body: some View {
        TabView(selection: $selectedTab) {
            MainScreenView().tabItem {
                TabBarImages.main.image
                TabBarLabels.main.label
            }
            CatalogScreenView().tabItem {
                TabBarImages.catalog.image
                TabBarLabels.catalog.label
            }
            CartScreenView().tabItem {
                TabBarImages.cart.image
                TabBarLabels.cart.label
            }
            ProfileScreenView().tabItem {
                TabBarImages.profile.image
                TabBarLabels.profile.label
            }
        }.accentColor(.greenAccent)
        
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
