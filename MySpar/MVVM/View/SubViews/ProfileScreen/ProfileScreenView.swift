//
//  ProfileScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 15.08.2023.
//

import SwiftUI

struct ProfileScreenView: View {
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            TabBarLabels.profile.label
        }
    }
}

struct ProfileScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreenView()
    }
}
