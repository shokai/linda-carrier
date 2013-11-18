#!/usr/bin/env ruby
require 'rubygems'
require 'bundler/setup'
require 'eventmachine'
require 'em-rocketio-linda-client'
require 'args_parser'
$:.unshift File.expand_path '../lib', File.dirname(__FILE__)
require 'deck'
$stdout.sync = true

args = ArgsParser.parse ARGV do
  arg :base, 'linda base URL', :default => 'http://linda.shokai.org'
  arg :help, 'show help', :alias => :h

  on :help do
    STDERR.puts "em-rocketio-linda-client v#{EM::RocketIO::Linda::Client::VERSION}"
    STDERR.puts help
    exit 1
  end
end

deck = LindaCarrier::Deck.new

EM::run do
  linda = EM::RocketIO::Linda::Client.new args[:base]

  linda.io.on :connect do
    puts "connect!! <#{linda.io.session}> (#{linda.io.type})"

    deck.workers.each do |w|
      ts = linda.tuplespace[w.space]
      ts.instance_eval w.code
      puts "#{w.path} loaded"
    end
  end

  linda.io.on :disconnect do
    puts "RocketIO disconnected.."
  end

end
