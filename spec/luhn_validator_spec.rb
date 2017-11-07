require 'validators/luhn_validator'

describe LuhnValidator do
  it 'returns true when the number is valid' do
    expect(LuhnValidator.valid?('79927398713')).to be_truthy
    expect(LuhnValidator.valid?('5454545454545454')).to be_truthy
  end

  it 'returns false when the number is invalid' do
    expect(LuhnValidator.valid?('1234567890123456')).to be_falsey
    expect(LuhnValidator.valid?('79927398711')).to be_falsey
  end
end
