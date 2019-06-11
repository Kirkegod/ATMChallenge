require './lib/atm.rb'

describe Atm do
  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw(50)
    expect(subject.funds).to eq 950
  end


it 'gives status = true after successful withdrawal' do
    subject.withdraw(50)
    expect(subject.response()).to eq(true)
  end

  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are not reduced at withdraw > funds' do
    subject.withdraw(1001)
    expect(subject.funds).to eq 1000
  end


it 'gives status = false after unsuccessful withdrawal' do
    subject.withdraw(5000)
    expect(subject.response()).to eq(false)
  end
end