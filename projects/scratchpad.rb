def stock_picker(stock_prices)
  min_price = stock_prices[0]
  min_day = 0
  best = { profit: 0, buy: 0, sell: 0 }

  stock_prices.each_with_index do |price, day|
    profit = price - min_price
    
    if profit > best[:profit]
      best.merge!(profit: profit, buy: min_day, sell: day)
    end

    if price < min_price
      min_price = price
      min_day = day
    end

  end

  puts "Buy on day #{best[:buy]}, sell on day #{best[:sell]} for a profit of #{best[:profit]}"
  [best[:buy], best[:sell]]
end

stock_prices = [847, 23, 491, 716, 12, 84]

p stock_picker(stock_prices)