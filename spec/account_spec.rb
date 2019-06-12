require "./lib/account.rb"

describe Account do
  it "check length of a number" do
    number = 1234
    number_length = Math.log10(number).to_i + 1
    expect(number_length).to eq 4
  end

  it "is expected to have an expiry date on initialize" do
    # Here we set the validity of the card to 5 yrs as default
    expected_date = Date.today.next_year(5).strftime("%m/%y")
    expect(subject.exp_date).to eq expected_date
  end

  it 'is expected to have :active status on initialize' do
    expect(subject.account_status).to eq :active
  end

  it 'deactivates account using Class method' do
    Account.deactivate(subject)
    expect(subject.account_status).to eq :deactivated
  end

  it 'deactivates account using Instance method' do
  subject.deactivate
  expect(subject.account_status).to eq :deactivated
  end

end
