FactoryGirl.define do
  factory :charge do
    user nil
amount 1.5
card_last_four "MyString"
card_brand "MyString"
card_exp_month "MyString"
card_exp_year "MyString"
stripe_id "MyString"
  end

end
