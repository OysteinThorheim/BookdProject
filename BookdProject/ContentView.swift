//
//  ContentView.swift
//  BookdProject
//
//  Created by Øystein Thorheim on 02/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption: TopBarOptions = .soloartist
    @State private var currentOption: TopBarOptions = .soloartist
    var body: some View {
        VStack{
            HStack(spacing:16){
                Button {
                    
                } label:{
                    Image(systemName: "list.bullet")
                        .font(.title2)
                }
                
                Spacer()
                
                Text("Bookd")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    
                } label:{
                    Image(systemName: "magnifyingglass")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.black)
            
            // options list
            
            OptionsList(selectedOption: $selectedOption, currentOption: $currentOption)
                .padding([.top, .horizontal])
                .overlay(
                    Divider()
                    .padding(.horizontal, -16)
                , alignment: .bottom
                )
            
            ScrollViewReader { proxy in
                ScrollView(.vertical, showsIndicators: false) {
                    VStack{
                        ForEach(TopBarOptions.allCases, id: \.self) { option in
                            TalentSection(option: option, currentOption: $currentOption)
                        }
                    }
                    .onChange(of: selectedOption, perform: { _ in
                        withAnimation(.easeInOut){
                            proxy.scrollTo(selectedOption, anchor: .topTrailing)
                        }
                    })
                    .padding(.horizontal)
                }
                .coordinateSpace(name: "scroll")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
