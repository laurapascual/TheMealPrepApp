//
//  ListCellView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 2/8/23.
//
import SwiftUI

struct ListCellView: View {
    
    var meal: Meal
    
    init(meal: Meal) {
        self.meal = meal
    }
    
    var body: some View {
        VStack(alignment: .center, content: {
            
                        AsyncImage(url: meal.image,
                                   content: { image in
                                       image.resizable()
                                    .cornerRadius(10)
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 300)
                                   },
                                   placeholder: {
                                       ProgressView()
                        })
                        .accessibilityLabel("Recipe image")

                        VStack (alignment: .center, content: {
                            Text(meal.name)
                                .italic()
                                .fontWeight(.bold)
                                .font(.system(size: 18))
                                .multilineTextAlignment(.center)
                                .accessibilityLabel("Recipe name")
                            
                            Text(meal.area)
                                .fontWeight(.medium)
                                .font(.system(size: 14))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .accessibilityLabel("Recipe area")
                            
                            Text(meal.tags ?? "No tags")
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .center)
                                .accessibilityLabel("Recipe tags")
                        })
                }).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                
    }
}

