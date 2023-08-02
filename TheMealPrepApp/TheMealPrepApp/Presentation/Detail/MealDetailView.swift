//
//  MealDetailView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 2/8/23.
//

import SwiftUI

struct MealDetailView: View {
    let meal: Meal
    
    var body: some View {
        ScrollView {
            VStack {
                Text("\(meal.name) Recipe")
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
                Text(meal.instructions)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                YouTubeView(videoId: meal.videoUrl.components(separatedBy: "=")[1])
                    .frame(width: 350, height: 200)
                    .padding(20)
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: .init(id: "id", image: URL(string: "www.hola.com")!, name: "Hola", instructions: "", area: "", tags: "", videoUrl: ""))
    }
}


