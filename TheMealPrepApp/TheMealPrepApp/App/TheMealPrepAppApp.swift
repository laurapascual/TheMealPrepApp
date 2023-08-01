//
//  TheMealPrepAppApp.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import SwiftUI

@main
struct TheMealPrepAppApp: App {
    var body: some Scene {
        WindowGroup {
            let remoteDataSource = RemoteDataSourceImpl()
            let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
            RootView()
                .environmentObject(RootViewModel(repository: repository))
        }
    }
}
