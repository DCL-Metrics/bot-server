require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'json'

Dotenv.load
Bundler.require

Dir.glob('./lib/*.rb') { |f| require f }
require './server'

run Server
