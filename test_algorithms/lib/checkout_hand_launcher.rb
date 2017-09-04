require_relative 'checkout.rb'
require 'pry'
def start_function
  @checkout = Checkout.new
  p '****************************************'
  p '*****   START NEW CHECKOUT    **********'
  p '****************************************'
  add_rule
end

def add_rule
  p 'Write rule or press : [p] to begin scan product, [0] to exit or [1] to restart'
  rule = gets.strip
  return abort if rule == '0'
  return start_function if rule == '1'
  if rule == 'p'
    p 'Add products to checkout'
    p "Checkout rules - #{@checkout.rules_inspect}"
    p "Possible products - #{@checkout.products_inspect}"
    return add_product
  end
  @checkout.add_rule rule
  p "rules - [#{rule}]"
  add_rule
end

def add_product
  p "Add product #{@checkout.products_key} to scan or press : [0] to exit, [1] to restart"
  product = gets.strip.upcase
  return abort if product == '0'
  start_function if product == '1'
  p 'Quick scan = ' + @checkout.scan_quick(product)
  add_product
rescue
  p 'Input problem try again'
  add_product
end

start_function
