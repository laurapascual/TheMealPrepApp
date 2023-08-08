//
//  HomeView.swift
//  TheMealPrepApp
//
//  Created by Pascual Mateo Laura on 31/7/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var utensilios = false
    
    var body: some View {
        ZStack{
            Image(decorative: "foodImage").resizable().aspectRatio(contentMode: .fill).ignoresSafeArea().accessibilityLabel("Food image background")
            
            Button {
                rootViewModel.onClick()
            } label: {
                Text("Start cooking")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .frame(width: 150, height: 50)
                    
                    Image("utensilios")
                        .resizable()
                        .frame(width: 30, height: 50)
                        .rotation3DEffect(.degrees(utensilios ? 0 : -10), axis: (x: 0, y: 0, z: 10))
                        .offset(y: utensilios ? -10 : 0)
                        .onAppear{
                            withAnimation(.easeInOut(duration: 1).delay(0.5).repeatForever(autoreverses: true)){
                                utensilios.toggle()
                            }
                        }.padding()
            }.accessibilityAddTraits([.isButton])
                .accessibilityLabel("Start cooking button")
                .accessibilityHint("Start using the app")
                .background(Color(uiColor: UIColor(red: 255/255, green: 171/255, blue: 61/255, alpha: 1)))
                .cornerRadius(10.0)
                .shadow(radius: 0, x: 10, y: 10)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let remoteDataSource = RemoteDataSourceImpl()
                let repository = RepositoryImpl(remoteDataSource: remoteDataSource)
        HomeView()
            .environmentObject(RootViewModel(repository: repository))
    }
}
