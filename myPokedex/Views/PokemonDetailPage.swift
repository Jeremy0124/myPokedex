//
//  PokemonDetailPage.swift
//  myPokedex
//
//  Created by Jeremy Jackman on 8/17/22.
//

import SwiftUI

struct PokemonDetailPage: View {
    @State var pokemon: PokemonEntry = (.init(name: "default name", url: ""))
    
    var body: some View {
        VStack {
            PokemonImage__(imageLink: "\(pokemon.url)")
                .frame(width: 100, height: 100)
            
            Text(pokemon.name.capitalized)
            Spacer()
        }
    }
}

struct PokemonDetailPage_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailPage()
    }
}

