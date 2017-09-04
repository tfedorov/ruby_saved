# Task 2. Design. Discounts
class Checkout
  def initialize(*args)
    @defined_products = { 'FR' => 3.11, 'SR' => 5.00, 'CF' => 11.23,
                          'AJ' => 7.25 }
    @products_positions = []
    @rules = args
  end

  def add_rule(rule)
    @rules << rule
  end

  def rules_inspect
    @rules.to_a.inspect
  end

  def products_key
    res =''
    @defined_products.each_key { |key| res << "[#{key}] "}
    res
  end

  def products_inspect
    res =''
    @defined_products.each_pair { |key, value| res << "'#{key}'= #{value}$  "}
    res
  end

  # Add product to product lines
  def scan(product)
    fail "Product #{productd} oestn't exist" if @defined_products[product].nil?
    @products_positions << { product => @defined_products[product] }
  end

  def scan_quick(product)
    scan(product)
    pos_copy = @products_positions.dup
    procces_rules
    total_price = calc_positions(@products_positions)
    discounted_price = @products_positions.last.values.first

    # revert all
    @products_positions = pos_copy
    no_discount = @defined_products[product]
    "price of a product '#{product}'' without discount - #{no_discount}, discount - #{no_discount - discounted_price}, total price - #{total_price}"
  end

  # Implemented rule and calculate total price
  # rule should be ruby compliant code
  # example of rule 'first_SR_cost free if number_of_CF >= 4'
  def total
    procces_rules
    calc_positions(@products_positions)
  end

  private

  def procces_rules
    return if @rules.empty?
    @rules.each { |rule| instance_eval rule }
  end

  def calc_positions(positions_array)
    sum = 0
    positions_array.each { |position| sum += position.values.first }
    sum
  end

  # Method transform function from
  # every_second_SR_cost(12.32) to every_second_cost('SR',12.32)
  # Transformed function should be exist on Checkout object
  def method_missing(m, *args, &block)
    method_name = m.to_s
    @defined_products.each_key do |product_name|
      prod_pattern = '_' + product_name
      next unless method_name.include?(prod_pattern)
      possible_method_name = method_name.gsub!(prod_pattern, '').to_sym
      next unless private_methods.include?(possible_method_name)
      args.unshift(product_name)
      return send(possible_method_name, *args, &block)
    end
    fail "Method '#{m}' not implemented"
    # super(method_name, *args, &block)
  end

  # Method could be call from UI
  def free
    0
  end

  # Set price parameter price to every second product in product position line
  # could be call from UI
  # @param [String] product product name
  # @param [Float] price new price
  def every_second_cost(product, price)
    pair = false
    @products_positions.each do |position|
      next unless position.key? product
      pair = !pair
      next if pair
      position[product] = price
    end
  end

  # Set price parameter price to every product in product position line
  # could be call from UI
  # @param [String] product product name
  # @param [Float] price new price
  def every_cost(product, price)
    @products_positions.each { |position| position[product] = price }
  end

  # Get number of param product in product positions line
  # could be call from UI
  # @param [String] product product name
  # @return number of products
  def number_of(product)
    number = 0
    @products_positions.each { |position| number += 1 if position.key? product }
    number
  end

  # Set price to first product in product positions line
  # could be call from UI
  # @param [String] product product name
  # @param [Float] price new price
  def first_cost(product, price)
    @products_positions.each { |position| return position[product] = price if position.key? product }
  end

  # Get number of ALL product in product positions line
  # could be call from UI
  # @return number of ALL products
  def number_of_ALL
    @products_positions.size
  end

  # Get discount for ALL product in product positions line
  # could be call from UI
  # @param [Integer] percentage of discount
  def discount_ALL(percentage)
    k = (100 - percentage) / 100.00
    @products_positions.each { |position| position[position.keys.first] *= k }
  end
end
