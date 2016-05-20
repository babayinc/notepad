require 'twitter'

class Tweet < Post

  @@CLIENT = Tweet::REST::Client.new do |config|
    config.consumer_key = 'K7gb6Y0ZmVtPr4SLq8RvkUK0U'
    config.consumer_secret = 'rAho3P9cLlwfesBBnQo1kIljwGAzRRcKKVYX8ntiUpKpNh8KOc'
    config.access_token = '950101237-XGXDCGm47rGbRsAmFgwB5UG2OVeSlMF6nS5NFx3j'
    config.access_token_secret = 'vgGyXNVVqz14gfSHT2mPDG86XvTYLBIfgDXSXuNttnIkZ'
  end

  def read_from_console
    puts 'New twit'

    @text = STDIN.gets.chomp[0..140]

    puts "Send tweet: #{@text.encode('utf-8')}"
    @@CLIENT.update(@text.encode('utf-8'))

  end

  def to_strings
    time_string = "Created: #{@created_at.strftime("%Y-%m-%d_%H-%M-%S.txt")} \n\r \n\r"

    return @text.unshift(time_string)

  end

  def to_db_hash
    return super.merge(
        {
            'text' => @text.join('\n\r')
        }
    )
  end

  def load_data(data_hash)
    super(data_hash)

    @text = data_hash['text'].split('n\r')

  end

end