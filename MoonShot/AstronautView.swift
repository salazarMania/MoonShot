//
//  AstronautView.swift
//  MoonShot
//
//  Created by SANIYA KHATARKAR on 02/07/24.
//

import SwiftUI

struct AstronautView: View{
    let astronaut : Astronaut
    
    var body: some View{
        ScrollView{
            VStack{
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
    
    }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    
    static var previews: some View {
        let astronauts : [String: Astronaut] = Bundle.main.decode("astronauts.json")
        
        return AstronautView(astronaut: astronauts["aldrin"]!)
                .preferredColorScheme(.dark)
    }
}
