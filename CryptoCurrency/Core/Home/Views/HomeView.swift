//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 02/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio:Bool = false
    @EnvironmentObject private var vm:HomeViewModel
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background.ignoresSafeArea()
            //content layer
            VStack{
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                columnTittles
                /// go to portfolio coin
                if !showPortfolio{
                    allCoinList.transition(.move(edge:.leading))
                }
                /// go to all coin
                if showPortfolio{
                    portfolioCoinList.transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
                
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{  
            HomeView().navigationBarHidden(true)
        }
        .environmentObject(dev.homeVM)
    }
}


extension HomeView{
    
    /// my homeheader
    private var homeHeader: some View{
        HStack{
            CircleButtonView(iconName: showPortfolio ? "plus" : "info").animation(nil, value: UUID())
                .background(
                    CircleButtonAnimationView(animate: $showPortfolio)
                )
            // no animation with nil and value UUID
            Spacer()
            Text(showPortfolio ? "My Portfolio" : "Live Price").font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accent)
                .animation(nil, value: UUID())
            // no animation with nil and value UUID
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()){
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    /// all coin view
    private var allCoinList: some View{
        List{
            ForEach(vm.allCoins){
                coin in CoinRowView(coin: coin, showHoldingColumn: false)
                    .listRowInsets(.init(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                )
            }
        }
        .listStyle(PlainListStyle())
    }
    
    ///holding coin view
    private var portfolioCoinList: some View{
        List{
            ForEach(vm.portfolioCoins){
                coin in CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(EdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 10))
                )
            }
        }
        .listStyle(PlainListStyle())
    }
    
    /// 1 column in coin list
    private var columnTittles:some View{
        HStack{
            Text("Coin")
            Spacer()
            if showPortfolio{
                Text("Holdings")
            }
            Text("Price")
                .frame(width:UIScreen.main.bounds.width / 3.5,alignment: .trailing )
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
        
    }
}
//home header
