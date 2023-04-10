//
//  MarketDataModel.swift
//  CryptoCurrency
//
//  Created by PhuongDo on 08/04/2023.
//

import Foundation
// JSON data:
/*
 
 URL: https://api.coingecko.com/api/v3/global
 JSON Response:{
 "data": {
   "active_cryptocurrencies": 10907,
   "upcoming_icos": 0,
   "ongoing_icos": 49,
   "ended_icos": 3376,
   "markets": 709,
   "total_market_cap": {
     "btc": 43821790.54328723,
     "eth": 657703798.3730919,
     "ltc": 13530126848.48314,
     "bch": 9872496573.231853,
     "bnb": 3934834339.718565,
     "eos": 1010328459331.504,
     "xrp": 2392562832553.8125,
     "xlm": 11584744286720.19,
     "link": 168974535432.41962,
     "dot": 199036174397.8286,
     "yfi": 142311623.05506364,
     "usd": 1224425994215.1016,
     "aed": 4496820784224.403,
     "ars": 256899111196157.97,
     "aud": 1835720671826.991,
     "bdt": 129635852354621.12,
     "bhd": 461548602945.37555,
     "bmd": 1224425994215.1016,
     "brl": 6191310039748.648,
     "cad": 1660260426855.969,
     "chf": 1108794876599.409,
     "clp": 1001923302546332.9,
     "cny": 8412663678453.7,
     "czk": 26179083630088.832,
     "dkk": 8363686638685.086,
     "eur": 1113492999139.2158,
     "gbp": 985770674830.6487,
     "hkd": 9611437948090.016,
     "huf": 421667823887797.06,
     "idr": 18294087558268144,
     "ils": 4409219226468.284,
     "inr": 100250177036304.27,
     "jpy": 161813977973666.9,
     "krw": 1611758350501502.5,
     "kwd": 375898780224.0365,
     "lkr": 391579859449682,
     "mmk": 2571698849235670,
     "mxn": 22193578243344.703,
     "myr": 5391147652529.118,
     "ngn": 569358087310022.8,
     "nok": 12850473251886.924,
     "nzd": 1953456577726.7407,
     "php": 66900188696350.59,
     "pkr": 347736982357089,
     "pln": 5251237391874.093,
     "rub": 99300942008714.84,
     "sar": 4593372895998.237,
     "sek": 12822678781818.229,
     "sgd": 1631045622633.9946,
     "thb": 41880572812631.94,
     "try": 23570935044237.25,
     "twd": 37232469299118.266,
     "uah": 45021542614125.98,
     "vef": 122601774800.75807,
     "vnd": 28708700152943104,
     "zar": 22319118640531.58,
     "xdr": 909447304907.2424,
     "xag": 49024131192.34177,
     "xau": 609874343.4585997,
     "bits": 43821790543287.234,
     "sats": 4382179054328723.5
   },
   "total_volume": {
     "btc": 1304214.148520603,
     "eth": 19574430.636890694,
     "ltc": 402680553.4027475,
     "bch": 293822994.2775015,
     "bnb": 117107643.35100392,
     "eos": 30069165476.284206,
     "xrp": 71206910049.89545,
     "xlm": 344782520714.41516,
     "link": 5028981634.9007225,
     "dot": 5923669286.416835,
     "yfi": 4235446.109943958,
     "usd": 36441087542.83575,
     "aed": 133833355904.38062,
     "ars": 7645772831519.345,
     "aud": 54634300498.59649,
     "bdt": 3858192709615.878,
     "bhd": 13736504390.35944,
     "bmd": 36441087542.83575,
     "brl": 184264359160.34854,
     "cad": 49412292653.70818,
     "chf": 32999700558.552933,
     "clp": 29819013114551.617,
     "cny": 250375780180.56158,
     "czk": 779135923986.0208,
     "dkk": 248918136678.84787,
     "eur": 33139525011.454895,
     "gbp": 29338282287.686573,
     "hkd": 286053426939.37555,
     "huf": 12549581728001.785,
     "idr": 544464466923132.44,
     "ils": 131226178296.12845,
     "inr": 2983622934195.044,
     "jpy": 4815870754828.968,
     "krw": 47968784904940.23,
     "kwd": 11187413875.650583,
     "lkr": 11654110583763.35,
     "mmk": 76538315375182.64,
     "mxn": 660520220475.179,
     "myr": 160450108451.10654,
     "ngn": 16945105707418.635,
     "nok": 382452857870.81573,
     "nzd": 58138329712.36548,
     "php": 1991068177606.5435,
     "pkr": 10349268862165.355,
     "pln": 156286131141.9356,
     "rub": 2955372017518.5435,
     "sar": 136706917862.571,
     "sek": 381625645183.593,
     "sgd": 48542808304.936066,
     "thb": 1246440068587.0408,
     "try": 701512799852.1143,
     "twd": 1108104270552.3923,
     "uah": 1339920896376.0825,
     "vef": 3648846095.6641417,
     "vnd": 854421794748857.6,
     "zar": 664256525180.9459,
     "xdr": 27066763536.791386,
     "xag": 1459045025.940333,
     "xau": 18150941.29421105,
     "bits": 1304214148520.603,
     "sats": 130421414852060.31
   },
   "market_cap_percentage": {
     "btc": 44.134021682351026,
     "eth": 18.312312004314126,
     "usdt": 6.559660605502124,
     "bnb": 4.012636499496827,
     "usdc": 2.66334725634874,
     "xrp": 2.1600699993923507,
     "ada": 1.104275342262688,
     "doge": 0.9421081601175298,
     "steth": 0.8962065118887718,
     "matic": 0.8201178778002984
   },
   "market_cap_change_percentage_24h_usd": -0.4794026694070851,
   "updated_at": 1680919276
 }
}
 */
struct GlobalData: Codable {
    let data: MarketDataModel?
}

struct MarketDataModel: Codable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double
    
    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: String {
        if let item = totalMarketCap.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
        }
        return ""
    }
    
    var volume: String {
        if let item = totalVolume.first(where: { $0.key == "usd" }) {
            return "$" + item.value.formattedWithAbbreviations()
            
        }
        return ""
    }
        
        var btcDominance: String {
            if let item = marketCapPercentage.first(where: { $0.key == "btc" }) {
                return item.value.asPercentString()
            }
            return ""
        }
        
    }
    
    

