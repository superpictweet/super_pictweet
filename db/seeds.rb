require 'csv'

csv_data = CSV.read('db/tweets.csv', headers: true)
csv_data.each do |data|
  Tweet.create!(data.to_hash)
end
