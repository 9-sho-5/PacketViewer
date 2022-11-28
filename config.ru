#Gemfileの一括require
require 'bundler'
Bundler.require

# applicationの立ち上げ設定
require './app'
run Sinatra::Application
