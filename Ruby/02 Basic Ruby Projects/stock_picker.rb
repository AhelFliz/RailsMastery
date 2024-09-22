#Implement a method #stock_picker that takes in an array of stock prices, one for each hypothetical day. It should return a pair of days representing the best day to buy and the best day to sell. Days start at 0.

#  > stock_picker([17,3,6,9,15,8,6,1,10])
#  => [1,4]  # for a profit of $15 - $3 == $12
#Quick Tips:

#You need to buy before you can sell
#Pay attention to edge cases like when the lowest day is the last day or the highest day is the first day.


def stock_picker(prices)
  max_profit = 0
  best_days = []

  prices.each_with_index do |buy_price, buy_day|
    # Consideramos solo los días posteriores para la venta
    (buy_day + 1...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      profit = sell_price - buy_price

      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  best_days
end

# Ejemplo de uso:
prices = [17,3,6,9,15,8,6,1,10]
resultado = stock_picker(prices)
puts "Los mejores días para comprar y vender son: #{resultado}"  # Output: [1, 4]l
