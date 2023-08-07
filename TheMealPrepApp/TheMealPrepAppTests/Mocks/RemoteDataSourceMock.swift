//
//  RemoteDataSourceMock.swift
//  TheMealPrepAppTests
//
//  Created by Pascual Mateo Laura on 7/8/23.
//

import Foundation
@testable import TheMealPrepApp

final class RemoteDataSourceMock: RemoteDataSourceProtocol {
    func getMeals() async throws -> [Meal] {
        return [Meal (id: "52768", image: URL(string: "https://www.themealdb.com/images/media/meals/wxywrq1468235067.jpg")! , name: "Apple Frangipan Tart", instructions: "Preheat the oven to 200C 180C Fan Gas 6.Put the biscuits in a large re-sealable freezer bag and bash with a rolling pin into fine crumbs. Melt the butter in a small pan, then add the biscuit crumbs and stir until coated with butter. Tip into the tart tin and, using the back of a spoon, press over the base and sides of the tin to give an even layer. Chill in the fridge while you make the filling.Cream together the butter and sugar until light and fluffy. You can do this in a food processor if you have one. Process for 2-3 minutes. Mix in the eggs, then add the ground almonds and almond extract and blend until well combined.Peel the apples, and cut thin slices of apple. Do this at the last minute to prevent the apple going brown. Arrange the slices over the biscuit base. Spread the frangipane filling evenly on top. Level the surface and sprinkle with the flaked almonds.Bake for 20-25 minutes until golden-brown and set.Remove from the oven and leave to cool for 15 minutes. Remove the sides of the tin. An easy way to do this is to stand the tin on a can of beans and push down gently on the edges of the tin.Transfer the tart, with the tin base attached, to a serving plate. Serve warm with cream, fraiche or ice cream.", area: "British", tags: "Tart,Baking,Fruity", videoUrl: "https://www.youtube.com/watch?v=rp8Slv4INLk")]
    }
}
