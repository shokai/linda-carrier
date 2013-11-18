require 'yaml'
require 'hashie'

module LindaCarrier
  class Deck

    attr_reader :workers, :config

    def initialize(config_file_path=File.expand_path("../workers.yml", File.dirname(__FILE__)))
      raise "config file \"#{path}\" not exists" unless File.exists? config_file_path
      @workers = []
      @config = Hashie::Mash.new YAML.load File.open(config_file_path).read
      @config.each do |space, items|
        items.each do |i|
          @workers << Hashie::Mash.new(
                                      :code => File.open(i).read,
                                      :path => i,
                                      :space => space
                                      )
        end
      end
    end

  end
end
