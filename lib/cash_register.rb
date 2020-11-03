class CashRegister
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @transactions = []
    end
    attr_accessor :total, :discount, :items
    def add_item(name, price, quantity=1)
        self.total+=(price*quantity)
        quantity.times do @items << name end
        @transactions << price
    end
    def apply_discount
        if @discount == 0
            return "There is no discount to apply."
        else
            self.total = @total*((100-@discount)*0.01)
            self.total = @total.to_i
            return "After the discount, the total comes to $#{@total}."
        end
    end
    def void_last_transaction
        self.total -= @transactions.pop
        if @transactions.length == 0
            @total = 0
        end
    end
end