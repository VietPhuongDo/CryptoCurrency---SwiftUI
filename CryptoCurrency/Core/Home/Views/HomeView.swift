//
//  HomeView.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 02/04/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showPortfolio:Bool = false  // animate right
    @State private var showPortfolioView: Bool = false  // new sheet
    @State private var showSettingView: Bool = false // new sheet
    @EnvironmentObject private var vm:HomeViewModel
    
    @State private var selectedCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
    var body: some View {
        ZStack{
            //background layer
            Color.theme.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
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
                    ZStack(alignment: .top){
                        if (vm.portfolioCoins.isEmpty && vm.searchText.isEmpty){
                            emptyPortfolioText
                        }
                        else  {portfolioCoinList}
                    }
                  .transition(.move(edge: .trailing))
                }
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingView, content: {
                SettingView()
            })
        }
        .background(
            NavigationLink(
                destination: DetailLoadingView(coin:$selectedCoin), isActive: $showDetailView,
                    label:{EmptyView()})
        )
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
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none)
                .onTapGesture{
                    if showPortfolio{
                        showPortfolioView.toggle()
                    }
                    else{
                        showSettingView.toggle()
                    }
                }
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
            ForEach(vm.allCoins){ coin in
                        CoinRowView(coin: coin, showHoldingColumn: false)
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                            .onTapGesture {
                                 segue(coin: coin)
                            }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    ///holding coin view
    private var portfolioCoinList: some View{
        List{
            ForEach(vm.portfolioCoins){
                coin in CoinRowView(coin: coin, showHoldingColumn: true)
                    .listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(PlainListStyle())
    }
    private func segue(coin:CoinModel){
        selectedCoin = coin
        showDetailView.toggle()
    }
    
    private var emptyPortfolioText: some View{
        Text("You haven't added any coins to your portfolio!Click the + button to add some coins 💸!")
            .font(.callout)
            .foregroundColor(Color.theme.accent)
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .padding(50)
    }
    
    /// 1 column in coin list
    private var columnTittles:some View{
        HStack{
            HStack(spacing: 4){
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity( (vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture{
                vm.sortOption = vm.sortOption == .rank ? . rankReversed : .rank
            }
            
            Spacer()
            if showPortfolio{
                HStack(spacing: 4){
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity( (vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0 )
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture{
                    vm.sortOption = vm.sortOption == .holdings ? . holdingsReversed : .holdings
                }
            }
            HStack(spacing: 4){
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity( (vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0 )
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))

            }
                .frame(width:UIScreen.main.bounds.width / 3.5,alignment: .trailing )
                .onTapGesture{
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            
            Button(action: {
                withAnimation(.linear(duration: 2.0)){
                    vm.reloadData()
                }
            }, label: {
                Image(systemName: "goforward")
            })
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 :0), anchor: .center)
        }
        .font(.caption)
        .foregroundColor(Color.theme.secondaryText)
        .padding(.horizontal)
        
    }
}
//home header
