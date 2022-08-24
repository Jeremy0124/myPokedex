//
//  PokemonImage  .swift
//  myPokedex
//
//  Created by Jeremy Jackman on 7/13/22.
//

import SwiftUI

struct PokemonImage__: View {
    var imageLink = ""
    @State private var pokemonSprite = ""
    
    var body: some View {
        AsyncImage(url: URL(string: pokemonSprite))
            .frame(width: 100, height: 100)
            .onAppear(){
                let loadedData = UserDefaults.standard.string(forKey: imageLink)
                
                if loadedData == nil {
                    getSprite(url: imageLink)
                    UserDefaults.standard.set(imageLink, forKey: imageLink)
                    print("NEW URL!!! CACHING")
                } else {
                    getSprite(url: loadedData!)
                    print("using cach url...")
                }
            }
            .clipShape(Circle())
            .foregroundColor(Color.gray.opacity(0.60))
    }
    func getSprite(url:String) {
        var tempSprite: String?
        
        PokemonSelectedApi().getData(url: url) { sprite in
            tempSprite = sprite.front_default
            self.pokemonSprite = tempSprite ?? "placeholder"
        }
    }
}

struct PokemonImage___Previews: PreviewProvider {
    static var previews: some View {
        PokemonImage__()
    }
}
