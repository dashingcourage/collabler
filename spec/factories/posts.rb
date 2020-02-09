FactoryBot.define do
  factory :post do
    caption { "Foobar" }
    image { Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/doggy10.jpg'), 'image/jpeg') }
  end
end