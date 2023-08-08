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
    @State private var 🔙 = false
    
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
                .accessibilityLabel("Filter by area")
                .accessibilityHint("Display the picker to choose the recipes by area")
                switch (listViewModel.statusList) {
                    
                case StatusList.loading:
                    ProgressView("Looking for meals...")
                        .font(.system(size:12))
                    
                case StatusList.loaded:
                    ForEach(listViewModel.searchedMeals) { meal in
                        NavigationLink {
                            MealDetailView(meal: meal)
                        } label: {
                            ListCellView(meal: meal)
                                .accessibilityLabel("Filter by area")
                        }
                    }.navigationTitle(Text("Meals list")) .navigationBarTitleDisplayMode(.inline) .listRowSeparator(.hidden)
                        .overlay(RoundedRectangle(cornerRadius: 15)
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [15.0])))
                }
            }
            .toolbar {
                Button("🔙") {
                    rootViewModel.goToHome()
                }.rotation3DEffect(.degrees(🔙 ? 20 : -20), axis: (x: 20, y: 20, z: 10))
                .offset(y: 🔙 ? -10 : 0)
                .onAppear{
                    withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)){
                        🔙.toggle()
                    }
                }
                .accessibilityAddTraits([.isButton])
                .accessibilityLabel("Back button")
                .accessibilityHint("Press to back to HomeView")
            }
            
        }.scrollContentBackground(.hidden)
            .searchable(text: $listViewModel.searchText)
            .accessibilityLabel("Search recipes by name")
            .accessibilityHint("Write the recipe you are looking for")
    }

    struct ListView_Previews: PreviewProvider {
        static var previews: some View {
            ListView(listViewModel: ListViewModel(repository: RepositoryImpl(remoteDataSource: RemoteDataSourceImpl())))
        }
    }
}
