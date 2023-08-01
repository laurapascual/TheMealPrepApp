//
//  RootViewModel.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import Foundation
import Combine

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}


final class RootViewModel: ObservableObject {
    
    @Published var status = Status.none
    private var subscribers = Set<AnyCancellable>()
      
}
