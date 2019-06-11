require './lib/atm.rb'

describe Atm do
  it 'has 1000$ on initialize' do
    expect(subject.funds).to eq 1000
  end

  it 'funds are reduced at withdraw' do
    subject.withdraw(50, account)
    expect(subject.funds).to eq 950
  end

  let (:account) { instance_double('Account') }

  before do
    allow(account).to receive(:balance).and_return(100)
    allow(account).to receive(:balance=)
  end
  it "allow withdraw if account has enough balance" do
    expected_output = {status: true, message: 'success', date: Date.today, amount: 45}
    expect(subject.withdraw(45, account)).to eq expected_output
  end

  it 'rejects withdraw if account has insufficient funds' do
    expected_output = { status: false, message: 'insufficient funds', date: Date.today }
    expect(subject.withdraw(105, account)). to eq expected_output
  end
  
  it 'reject withdraw if ATM has insufficient funds' do
    # To prepare the test we want to decrease the funds value
    # to a lower value then the original 1000
    subject.funds = 50
    # Then we set the `expected_output`
    expected_output = { status: false, message: 'insufficient funds in ATM', date: Date.today }
    # And prepare our assertion/expectation
    expect(subject.withdraw(100, account)).to eq expected_output

  end
# it 'gives status = true after successful withdrawal' do
#     subject.withdraw(50)
#     expect(subject.response()).to eq(true)
#   end

#   it 'has 1000$ on initialize' do
#     expect(subject.funds).to eq 1000
#   end

#   it 'funds are not reduced at withdraw > funds' do
#     subject.withdraw(1001)
#     expect(subject.funds).to eq 1000
#   end


# it 'gives status = false after unsuccessful withdrawal' do
#     subject.withdraw(5000)
#     expect(subject.response()).to eq(false)
#   end
end