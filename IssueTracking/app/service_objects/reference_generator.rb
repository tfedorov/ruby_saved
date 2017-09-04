#
module IssueTracking
  #
  class ReferenceGenerator
    require 'securerandom'
    AVAILABLE_CHARS = [*'A'..'Z']
    CHARS_NUMBER = 3
    REFERENCES_MAX_NUMBER = (AVAILABLE_CHARS.size**CHARS_NUMBER) * (16**4)

    def generate_random
      random_chars = AVAILABLE_CHARS.sample(CHARS_NUMBER).join
      random_hex_1 = SecureRandom.hex(1)
      random_hex_2 = SecureRandom.hex(1)
      format_key(random_chars, random_hex_1, random_hex_2)
    end

    private

    def format_key(alphabetical, hex_1, hex_2)
      "#{alphabetical}-#{hex_1}-#{alphabetical}-#{hex_2}-#{alphabetical}".upcase
    end
  end
end
