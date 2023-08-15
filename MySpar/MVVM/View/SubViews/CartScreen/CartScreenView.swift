//
//  CartScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI

struct CartScreenView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            TabBarLabels.cart.label
        }
    }
}

struct CartScreenView_Previews: PreviewProvider {
    static var previews: some View {
        CartScreenView()
    }
}
