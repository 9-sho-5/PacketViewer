require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

get '/' do
    @data = {
        version: 0,
        length: 0,
        service_type: 0,
        packet_length: 0,
        identificatipn: 0,
        flagment: 0,
        ttl: 0,
        transport: 0,
        header_checksum: 0,
        source_ip_address: 0,
        destination_ip_address: 0,
        options: 0,
        padding: 0,
        data: 0,
    }
    erb :index
end