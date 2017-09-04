#Education APPLICATION for Fedorov Taras
Repo consist with 3 task
* Task 1. Algorithms. Combinations.
* Task 2. Design. Discounts.
* Task 3. Application. Discounts UI

= Prerequisites

* Ruby http://www.ruby-lang.org/en/downloads/
* Ruby Gems http://rubygems.org/
* Bundler: sudo gem install bundler rake

== Configuration

* sudo bundle install

# Task 1. Algorithms. Combinations.

Code usage
```{r, engine='ruby', count_lines}
require 'algorithm'
include Algorithm

dictionary = %w(a b c ab abc)
target = 'aabc'
find_combinations(dictionary, target)
```
**find_combinations** method use recursion. Method does NOT valid input data. 

You could run program  using rspec or using launcher

* rspec --format doc spec/algorithm_spec.rb
* https://github.com/tfedorov/test_algorithms/wiki/Algorithms-UI.-Application-example


# Task 2. Design. Discounts.

Code usage
```{r, engine='ruby', count_lines}
require 'checkout'

co = Checkout.new('every_second_FR_cost free', '
  every_SR_cost 4.50 if number_of_SR >= 3')
co.scan('FR')
co.scan('SR')
co.scan('FR')
co.scan('FR')
co.scan('CF')
co.total
```

* **Checkout#scan** method add product to product line. Product line array of hash. Every product in product line is a hash with name and price(e.g. { 'FR' => 3.11} {'SR' => 5.00}).
* **Checkout#total** method execute each rule, and sum all prices in product line. Rule could change price parameter for product in product line.

Rule is a valid ruby code see https://github.com/tfedorov/test_algorithms/wiki/Discounts-UI.-How-to-construct-rules .
Rule should be non tech person frendly. Rule executed by method instance_eval this could caused security issues.

You could run program  using rspec or using launcher

* rspec --format doc spec/checkout_spec.rb
* https://github.com/tfedorov/test_algorithms/wiki/Discounts-UI.-Application-example


# Task 3. Application. Discounts UI.

Code usage
```{r, engine='ruby', count_lines}
require 'checkout'

co = Checkout.new('first_SR_cost free if number_of_CF >= 4 and number_of_AJ >= 1', '
  discount_ALL 10 if number_of_ALL > 6 ')
co.scan_quick('CF')
co.scan_quick('CF')
co.scan_quick('AJ')
co.scan_quick('CF')
co.scan_quick('CF')
co.scan_quick('SR')
co.scan_quick('SR')
```

**Checkout#scan_quick** create checkouts and scan (type) product barcodes and
immediately see price without discount, discount, total price

Rule is a valid ruby code see https://github.com/tfedorov/test_algorithms/wiki/Discounts-UI.-How-to-construct-rules .
Rule should be non tech person frendly.

You could run program  using rspec or using launcher

* rspec --format doc spec/checkout_spec.rb
* https://github.com/tfedorov/test_algorithms/wiki/Discounts-UI.-Application-example
