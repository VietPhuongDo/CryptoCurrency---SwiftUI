//
//  PortfolioView.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 18/04/2023.
//

import SwiftUI



struct PortfolioView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: .leading, spacing: 0){
                    SearchBarView(searchText: $vm.searchText)
                    ScrollView(.horizontal, showsIndicators: true, content: {
                        LazyHStack(spacing: 10){
                            ForEach(vm.allCoins){ coin in
                                Text(coin.symbol.uppercased())
                                CoinLogoView(coin: coin)
                            }
                        }
                    })
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar(content: {
                ToolbarItem(placement: .navigationBarLeading){
                    XMarkButton()
                }
            })
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView().environmentObject(dev.homeVM)
    }
}
