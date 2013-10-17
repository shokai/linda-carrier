require 'hashie'

module LindaCarrier
  class Deck

    attr_reader :workers

    def initialize(path=File.expand_path("../workers/", File.dirname(__FILE__)))
      raise "directory \"#{path}\" not exists" unless File.exists? path
      @workers = Dir.glob(File.join path, "*.rb").map{|i|
        Hashie::Mash.new(:code => File.open(i).read,
                         :path => i,
                         :name => File.basename(i))
      }
    end

  end
end
