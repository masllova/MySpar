//
//  MainScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var vm = ViewModel()
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            VStack {
                header
                Divider()
                stories
            }
        }
    }
    var header: some View {
        HStack (spacing: 20) {
            HStack {
                Image.location
                    .resizable()
                    .frame(width: 16, height: 18)
                Locations.moscow.label
                    .font(.system(size: 14))
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.subLabel, lineWidth: 0.5)
            )
            Image.lines
                .resizable()
                .frame(width: 18, height: 13)
                .foregroundColor(.greenAccent)
            
        }
    }
    var stories: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 23) {
                ForEach (vm.storiesCollection.indices, id: \.self) { index in
                    VStack {
                        Button {
                            vm.storyByIndexIsViewed(index: index)
                        } label: {
                            Image(vm.storiesCollection[index].imageName)
                                .padding(3)
                                .background(
                                    Circle()
                                        .stroke(lineWidth: 2)
                                        .foregroundColor(
                                            vm.storiesCollection[index].isViewed ?
                                                .subLabel : .greenAccent)
                                )
                        }
                        Text(vm.storiesCollection[index].description)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 12))
                            .foregroundColor(.label)
                        Spacer()
                    }.padding(.top, 10)
                    
                }
            }.padding(.horizontal, 16)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
