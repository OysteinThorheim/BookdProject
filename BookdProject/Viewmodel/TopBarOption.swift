//
//  TopBarOption.swift
//  BookdProject
//
//  Created by Øystein Thorheim on 02/02/2022.
//

import Foundation

enum TopBarOptions: Int, CaseIterable {
    case soloartist
    case dj
    case speaker
    case consert
    case party
    
    var title: String {
        switch self {
        case .soloartist: return "Soloartister"
        case .dj: return "Djs"
        case .speaker: return "Foredragsholdere"
        case .consert: return "Konserter"
        case .party: return "Fest"
            
        }
    }
    
    var talents:[Talent] {
        switch self{
        case .soloartist: return soloartists
        case .dj: return djs
        case .speaker: return speakers
        case .consert: return soloartists + djs
        case .party: return djs
        }
    }
}
