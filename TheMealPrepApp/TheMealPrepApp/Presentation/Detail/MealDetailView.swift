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
                    .accessibilityAddTraits([.isHeader])
                    .underline()
                    .fontWeight(.semibold)
                    .font(.system(size: 20))
                    .lineLimit(nil)
                    .padding(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0))
                    .accessibilityLabel("\(meal.name)")
                
                AsyncImage(url: meal.image,
                           content: { image in
                               image
                            .resizable()
                            .clipShape(Circle())
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 150)
                            
                           },
                           placeholder: {
                               ProgressView()
                })
                .accessibilityLabel("Recipe image")
                
                Text(meal.instructions)
                    .multilineTextAlignment(.center)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                    .accessibilityLabel("\(meal.instructions)")
                
                YouTubeView(videoId: meal.videoUrl.components(separatedBy: "=")[1])
                    .accessibilityAddTraits([.startsMediaSession])
                    .frame(width: 350, height: 200)
                    .padding(20)
                    .accessibilityLabel("Recipe video")
                    .accessibilityHint("Click to play the recipe video")
            }
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: .init(id: "id", image: URL(string: "www.hola.com")!, name: "Hola", instructions: "", area: "", tags: "", videoUrl: ""))
    }
}
