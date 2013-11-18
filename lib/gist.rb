require 'json'
require 'httparty'

module LindaCarrier
  class Gist
    attr_reader :url, :data, :code

    def initialize(url)
      @url = url
      res = HTTParty.get "#{url}.json"
      raise "#{url} get error (code:#{res.code})" unless res.code == 200
      @data = JSON.parse res.body
      code_file = @data['files'].find{|i| i =~ /.+\.rb$/ }

      res2 = HTTParty.get "#{url}/raw/#{code_file}"
      raise "#{url} get error (code:#{res2.code})" unless res2.code == 200
      @code = res2.body
    end
  end
end


if __FILE__ == $0
  gist = LindaCarrier::Gist.new 'https://gist.github.com/shokai/6667948'
  p gist.code
end
