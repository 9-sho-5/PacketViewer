require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

get '/' do
    @res = {
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

post '/set_data' do
    data = params["data"]
    @res = {
        version: data[0, 1],
        length: data[1, 1],
        service_type: data[2, 2],
        packet_length: data[4, 4],
        identificatipn: data[8, 4],
        flagment: data[12, 4],
        ttl: data[16, 2],
        transport: data[18, 2],
        header_checksum: data[20, 4],
        source_ip_address: data[24, 8],
        destination_ip_address: data[32, 8],
        options: "未対応",
        data: data[40, 8],
    }
    @input = data
    erb :index
end