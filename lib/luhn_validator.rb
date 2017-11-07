class LuhnValidator
  ODD_MULTIPLIER = 2
  ODD_SUBTRACTOR = 9
  TOTAL_SUM_MODULO = 10

  class << self
    def valid?(number)
      odd_digits_sum = 0
      individual_digits_sum = 0

      split_digits(number).each_with_index do |digit, i|
        if i.odd?
          odd_digits_sum += calculate_odd_digit(digit.to_i)
        else
          individual_digits_sum += digit.to_i
        end
      end

      modulus_is_zero?(odd_digits_sum + individual_digits_sum)
    end

    private
    def split_digits(number)
      number.reverse.split('')
    end

    def calculate_odd_digit(digit)
      sum = digit * ODD_MULTIPLIER
      sum -= ODD_SUBTRACTOR if sum > ODD_SUBTRACTOR

      sum
    end

    def modulus_is_zero?(sum)
      (sum % TOTAL_SUM_MODULO).zero?
    end
  end
end
