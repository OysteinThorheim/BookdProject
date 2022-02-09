//
//  SearchView.swift
//  BookdProject
//
//  Created by Caroline Klakegg on 07/02/2022.
//

import Foundation
import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @ObservedObject var talentsController = TalentController()
                    
    var body: some View{
        
        //Searching retults
        ScrollView {
                   ScrollViewReader { proxy in
                       LazyVStack(alignment: .leading, spacing: 20) {
                           SearchingBar(text: $searchText)
                               .onChange(of: searchText) { value in
                                   talentsController.search(for: value)
                               }
                           ForEach ($talentsController.publishedInfo) { talents in
                               Text("")
                           }
                       }
                       .onAppear {
                           proxy.scrollTo(self.talentsController.publishedInfo.first!.id)
                       }
                   }
               }
               .padding()
           }
  }

struct SearchingBar: View {
    
    //UI bar
    @Binding var text: String
    @State var showCancelButton = false
    @Environment(\.presentationMode)var mode: Binding<PresentationMode>
    var body: some View{
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Search..", text: $text)
                            .onTapGesture {
                                withAnimation {
                                    showCancelButton = true
                                }
                            }
                    }
                    .padding(5)
                    .background(Color(.systemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemFill), lineWidth: 1)
                    )
                    if showCancelButton {
                        Button("cancel", action: {
                            hideKeyboard()
                            text = ""
                            withAnimation {
                                showCancelButton = false
                            }
                        })
                        .transition(.move(edge: .trailing))
                    }
                }.navigationBarBackButtonHidden(true)
                  .navigationBarItems(leading: Button(action: {
                      self.mode.wrappedValue.dismiss()
                     }){
                Image(systemName: "chevron.backward")
                             .foregroundColor(.black)
                             
            })
            
            }
        }

        extension View {
            func hideKeyboard() {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        }
 

    
