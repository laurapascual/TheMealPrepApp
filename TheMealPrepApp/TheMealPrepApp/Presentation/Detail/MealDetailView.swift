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
        VStack {
            Text("\(meal.name) recipe")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .padding(EdgeInsets(top: 10, leading: 0, bottom: 20, trailing: 0))
            Text(meal.instructions)
                .multilineTextAlignment(.center)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        }
    }
}

struct MealDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MealDetailView(meal: .init(id: "id", image: URL(string: "www.hola.com")!, name: "Hola", instructions: "", area: "", tags: "", videoUrl: ""))
    }
}
