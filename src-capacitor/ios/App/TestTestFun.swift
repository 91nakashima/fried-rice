struct StockTrade {

    enum Trade {
        case buy(stock: String, amount: Int)
        case sell(stock: String, amount: Int)
    }

    
    func order(type: Trade) {
        switch type {
        case let Trade.buy(stock, amount):
            print("\(stock)株を\(amount)購入する")
        case let Trade.sell(stock, amount):
            print("\(stock)株を\(amount)売却する")
        }

    }
    
    
    func bababa(_ name: String, _ val: String, _ huga: String) {
        print(name, val, huga)
    }

}


