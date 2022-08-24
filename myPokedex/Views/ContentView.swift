//
//  ContentView.swift
//  myPokedex
//
//  Created by Jeremy Jackman on 7/12/22.
//

import SwiftUI

struct ContentView: View {
    @State var pokemon = [PokemonEntry]()
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
            List {
                ForEach(searchText == "" ? pokemon : pokemon.filter( {
                    $0.name.contains(searchText.lowercased())
                })) { entry in
                    HStack {
                        PokemonImage__(imageLink: "\(entry.url)")
                            .padding(.trailing,20)
                        
                        NavigationLink("\(entry.name)".capitalized, destination: PokemonDetailPage(pokemon: entry)
                        )
                    }
                }
            }
            .onAppear {
                PokeAPI().getData() {
                    pokemon in
                    self.pokemon = pokemon
                }
            }
            .searchable(text: $searchText)
            .navigationTitle("Pokedex")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

