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
        version: data[0, 1] != "" ? data[0, 1] : "null",
        length: data[1, 1] != "" ? data[1, 1] : "null",
        service_type: data[2, 2] != "" ? data[2, 2] : "null",
        packet_length: data[4, 4] != "" ? data[4, 4] : "null",
        identificatipn: data[8, 4] != "" ? data[8, 4] : "null",
        flagment: data[12, 4] != "" ? data[12, 4] : "null",
        ttl: data[16, 2] != "" ? data[16, 2] : "null",
        transport: data[18, 2] != "" ? data[18, 2] : "null",
        header_checksum: data[20, 4] != "" ? data[20, 4] : "null",
        source_ip_address: data[24, 8] != "" ? data[24, 8] : "null",
        destination_ip_address: data[32, 8] != "" ? data[32, 8] : "null",
        options: "未対応",
        data: data[40..-1] != "" ? data[40..-1] : "null",
    }
    @input = data
    erb :index
end