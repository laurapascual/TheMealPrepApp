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

                        VStack (alignment: .center, content: {
                            Text(meal.name)
                                .fontWeight(.semibold)
                                .font(.system(size: 18))
                                .multilineTextAlignment(.center)
                            
                            Text(meal.area)
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Text(meal.tags ?? "No tags")
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .center)
                        })
                }).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 0))
                
    }
}

