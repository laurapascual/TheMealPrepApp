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
        VStack(alignment: .leading, content: {
            HStack(content: {
                        AsyncImage(url: meal.image,
                                   content: { image in
                                       image.resizable()
                                .aspectRatio(contentMode: .fill)
                                            .frame(width: 130, height: 70)
                                   },
                                   placeholder: {
                                       ProgressView()
                                   })

                        VStack (alignment: .center, content: {
                            Text(meal.name)
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                            
                            Spacer()
                            
                            Text(meal.area)
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            Spacer()
                            
                            Text(meal.tags ?? "No tags")
                                .font(.system(size: 12))
                                .frame(maxWidth: .infinity, alignment: .center)
                        })
                })
        }).padding(EdgeInsets(top: 40, leading: 0, bottom: 40, trailing: 0))
                
    }
}
