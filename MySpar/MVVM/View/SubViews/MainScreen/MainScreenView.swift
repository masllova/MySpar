//
//  MainScreenView.swift
//  MySpar
//
//  Created by Александра Маслова on 14.08.2023.
//

import SwiftUI

struct MainScreenView: View {
    var vm = ViewModel()
    @State private var currentBannerIndex = 0
    var body: some View {
        ZStack {
            Color.background.ignoresSafeArea()
            ScrollView {
                header
                Divider()
                stories
                VStack(spacing: 16) {
                    banners
                    saleCard
                    informationCards
                    createCategoryLabel(category: Categories.recomendation)
                    //
                    createCategoryLabel(category: Categories.sweetMood)
                    //
                }.padding(.horizontal, 16)
                
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
            }
        }
    }
    var banners: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.bannersURL, id: \.self) { url in
                    if let imageURL = URL(string: url) {
                        AsyncImage(url: imageURL) { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 323)
                                .cornerRadius(10)
                        } placeholder: {
                            ProgressView()
                                .frame(width: 343, height: 160)
                        }
                    }
                }
            }
        }
    }
    var saleCard: some View {
        Image.saleCard
            .resizable()
            .frame(width: 353, height: 100)
    }
    var informationCards: some View {
        ScrollView (.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.cardsCollection, id: \.self) { image in
                    Image(image)
                        .resizable()
                        .frame(width: 100, height: 120)
                }
            }
        }
    }
    
    
    func createCategoryLabel(category: String) -> some View {
        HStack {
            Text(category)
                .font(.system(size: 20))
                .bold()
            Spacer()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}

