//
//  ListView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 1/8/23.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var rootViewModel: RootViewModel
    @ObservedObject var listViewModel: ListViewModel
    
    init(listViewModel: ListViewModel) {
        self.listViewModel = listViewModel
    }
    
    var body: some View {
        NavigationView {
            List {
                Picker("Filter by area", selection: $listViewModel.filterOption) {
                    ForEach(AreaEnum.allCases, id: \.self){
                        area in
                        Text(area.rawValue)
                    }
                }
                ForEach(listViewModel.searchedMeals) { meal in
                    NavigationLink {
                        MealDetailView(meal: meal)
                    } label: {
                        ListCellView(meal: meal)
                    }
                }.navigationTitle(Text("Meals list")) .navigationBarTitleDisplayMode(.inline) .listRowSeparator(.hidden)
                    .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [15.0])))
            }
            .toolbar {
                Button("Back") {
                    rootViewModel.goToHome()
                }
            }
            
        }.scrollContentBackground(.hidden)
            .searchable(text: $listViewModel.searchText)
    }
    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(listViewModel: ListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
        }
    }
}
