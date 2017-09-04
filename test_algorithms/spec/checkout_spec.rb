require 'checkout'
RSpec.describe Checkout do
  context 'Examples in task description' do
    it 'Items: FR, SR, FR, FR, CF Total: $22.45' do
      co = Checkout.new('every_second_FR_cost free', '
        every_SR_cost 4.50 if number_of_SR >= 3')
      co.scan('FR')
      co.scan('SR')
      co.scan('FR')
      co.scan('FR')
      co.scan('CF')
      expect(co.total).to eq 22.45
    end
    it 'Items: FR, FR Total: $3.11' do
      co = Checkout.new('every_second_FR_cost free', '
        every_SR_cost 4.50 if number_of_SR >= 3')
      co.scan('FR')
      co.scan('FR')
      expect(co.total).to eq 3.11
    end
    it 'Items: SR, SR, FR, SR Total: $16.61' do
      co = Checkout.new('every_second_FR_cost free', '
        every_SR_cost 4.50 if number_of_SR >= 3')
      co.scan('SR')
      co.scan('SR')
      co.scan('FR')
      co.scan('SR')
      expect(co.total).to eq 16.61
    end
  end
  context 'Own examples tasks rules' do
    it 'Items: SR, SR, FR, FR, SR Total: $16.61' do
      co = Checkout.new('every_second_FR_cost free', '
        every_SR_cost 4.50 if number_of_SR >= 3')
      co.scan('SR')
      co.scan('SR')
      co.scan('FR')
      co.scan('FR')
      co.scan('SR')
      expect(co.total).to eq 16.61
    end
    it 'Items: SR, SR, FR, FR, SR, FR Total: $19.72' do
      co = Checkout.new('every_second_FR_cost free', '
        every_SR_cost 4.50 if number_of_SR >= 3')
      co.scan('SR')
      co.scan('SR')
      co.scan('FR')
      co.scan('FR')
      co.scan('SR')
      co.scan('FR')
      expect(co.total).to eq 19.72
    end
  end
  context 'Own examples own rules' do
    it 'Mine rule: Items: 4CF, AJ, SR Total: $52.17' do
      co = Checkout.new('first_SR_cost free if number_of_CF >= 4 and number_of_AJ >= 1')
      co.scan('CF')
      co.scan('CF')
      co.scan('AJ')
      co.scan('CF')
      co.scan('CF')
      co.scan('SR')
      expect(co.total).to eq 52.17
    end
    it 'Mine rule: Items: 4CF, AJ, 2SR Total: $57.17' do
      co = Checkout.new('first_SR_cost free if number_of_CF >= 4 and number_of_AJ >= 1')
      co.scan('CF')
      co.scan('CF')
      co.scan('AJ')
      co.scan('CF')
      co.scan('CF')
      co.scan('SR')
      co.scan('SR')
      expect(co.total).to eq 57.17
    end
    it 'Mine rule2: Items: 4CF, AJ, 2SR Total: 51.453' do
      co = Checkout.new('first_SR_cost free if number_of_CF >= 4 and number_of_AJ >= 1', '
        discount_ALL 10 if number_of_ALL > 6 ')
      co.scan('CF')
      co.scan('CF')
      co.scan('AJ')
      co.scan('CF')
      co.scan('CF')
      co.scan('SR')
      co.scan('SR')
      expect(co.total).to eq 57.17 * 0.9
    end
    it 'Mine rule3: Items: 4CF, AJ, 2SR Total: 51.453' do
      co = Checkout.new('first_SR_cost free if number_of_CF >1 or number_of_AJ >= 1')
      co.scan_quick('SR').should eq "price of a product 'SR'' without discount - 5.0, discount - 0.0, total price - 5.0"
      co.scan_quick('AJ').should eq "price of a product 'AJ'' without discount - 7.25, discount - 0.0, total price - 7.25"
      co.scan_quick('SR').should eq "price of a product 'SR'' without discount - 5.0, discount - 0.0, total price - 12.25"
      expect(co.total).to eq 12.25
    end
    it 'Wrong rule: expect Method "rule1" not implemented' do
      co = Checkout.new('rule1', 'rule2')
      co.scan('SR')
      expect { co.total }.to raise_error("Method 'rule1' not implemented")
    end
  end
end
