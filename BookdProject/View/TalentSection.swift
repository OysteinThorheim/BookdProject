//
//  TalentSection.swift
//  BookdProject
//
//  Created by Øystein Thorheim on 02/02/2022.
//

import SwiftUI

struct TalentSection: View {
    let option: TopBarOptions
    @Binding var currentOption: TopBarOptions
    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text(option.title)
                .font(.title.bold())
                .padding(.vertical)
            
            ForEach(option.talents) { talent in
                HStack(spacing: 16) {
                    VStack(alignment: .leading, spacing:  8){
                        Text(talent.title)
                            .font(.title3.bold())
                        
                        Text(talent.description)
                            .font(.caption)
                            .foregroundColor(.gray)
                        
                        Text("Pris: \(talent.price)")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                        
                    }
                    
                    Spacer()
                    
                    Image(talent.imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 96, height: 88)
                        .clipped()
                        .cornerRadius(10)
                    
                }
            }
        }
        .modifier(OffsetModifier(option: option, currentOption: $currentOption))
    }
}

/*struct MenuItemSection_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemSection(option: ., currentOption: )
    }
}*/
 
