require 'faraday'
require 'json' # JS Object Notation

token = 'BEARER TOKEN'
url = 'https://api.twitter.com/2/users/1340584098075717635/tweets'

# HTTP: GET / POST
response = Faraday.get(
  url,
  { max_results: 12 },
  { "Authorization" => "Bearer #{token}" }
)

# Замена для библиотеки JSON - это Oj

raw_tweets = JSON.parse(response.body) # => hash
tweets = raw_tweets['data'].map { |t| t['text'] }
# puts tweets # => array, содержащий строки (strings)

# Вводим знак зодиака с клавиатуры:
puts 'Введите свой знак зодиака:'
zodiac = gets.strip.downcase

found = tweets.select do |tweet|
  # => мы выдаём тот элемент который удовлетворяет условию
  # само условие мы пишем внутри этого блока do-end
  tweet.downcase.include?(zodiac) # => наше условие для поиска
end

puts found.first
