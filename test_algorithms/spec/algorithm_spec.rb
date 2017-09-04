require 'algorithm'
include Algorithm
RSpec.describe Algorithm do
  context 'Examples in task description' do
    it 'dictionary = [a b c ab abc] target = aabc' do
      dictionary = %w(a b c ab abc)
      target = 'aabc'
      find_combinations(dictionary, target).should match_array(['a abc', 'a a b c', 'a ab c'])
    end
    it 'dictionary = [a b c ab abc] target = aabcx' do
      dictionary = %w(a b c ab abc)
      target = 'aabcx'
      expect(find_combinations(dictionary, target)).to eq []
    end
  end
  context 'Own examples' do
    it 'dictionary = [aabc] target = aabc' do
      dictionary = %w(aabc)
      target = 'aabc'
      expect(find_combinations(dictionary, target)).to eq %w(aabc)
    end
    it 'dictionary = [aabc a b c] target = aabc' do
      dictionary = %w(aabc a b c)
      target = 'aabc'
      find_combinations(dictionary, target).should match_array(['aabc', 'a a b c'])
    end
    it 'dictionary = [aabc a b c aa bc] target = aabc' do
      dictionary = %w(aabc a b c aa bc)
      target = 'aabc'
      result = find_combinations(dictionary, target)
      result.should match_array(['aabc', 'a a b c', 'aa bc', 'a a bc', 'aa b c'])
    end
    it 'dictionary = [aabc aa bc] target = aabcaabc' do
      dictionary = %w(aabc aa bc)
      target = 'aabcaabc'
      result = find_combinations(dictionary, target)
      result.should match_array(['aabc aabc', 'aa bc aabc', 'aa bc aa bc', 'aabc aa bc'])
    end
  end
end
