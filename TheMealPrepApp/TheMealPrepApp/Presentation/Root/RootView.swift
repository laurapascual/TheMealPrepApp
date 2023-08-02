//
//  RootView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import SwiftUI

struct RootView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    
    
    
    var body: some View {
        switch (rootViewModel.status) {
            
        case Status.none:
            HomeView()
        
        case Status.loading:
            ProgressView()
        
        case Status.error(error: let errorString):
            Text("Error \(errorString)")
            
        case Status.loaded:
            let listViewModel = ListViewModel(repository: rootViewModel.repository)
                ListView(listViewModel: listViewModel)
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
    }
}
