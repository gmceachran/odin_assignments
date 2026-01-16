def stock_picker(stock_prices)
  day = 0
  length = stock_prices.length - 1
  best = { profit: 0, buy: 0, sell: 0 }

  while day <= length do
    stock_prices.each_with_index do |selling_day_price, selling_day_index|

      if day < selling_day_index
        profit = selling_day_price - stock_prices[day]
        best.merge!(profit: profit, buy: day, sell: selling_day_index) if profit > best[:profit] 
      end
    end

    day += 1
  end

  [ best[:buy], best[:sell] ]
end

stock_prices = [847, 23, 491, 672, 938, 15, 204, 756, 89]
p stock_picker(stock_prices)