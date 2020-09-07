FactoryBot.define do

  factory :image do
    image      {File.open("#{Rails.root}/spec/fixtures/images/icon-01.png")}
  end

end