require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

get '/' do
    @v_flag = 6
    @res_v4 = {
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
    @res_v6 = {
        version: 0,
        trafic: 0,
        flow_label: 0,
        payload_length: 0,
        next_header: 0,
        hop_limit: 0,
        source_address: 0,
        destination_address: 0,
        data: 0,
    }
    erb :index
end

post '/set_data' do
    data = params["data"]
    check_v(data)
    if @v_flag == 4
        @res_v4 = {
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
    elsif @v_flag == 6
        @res_v6 = {
            version: data[0, 1] != "" ? data[0, 1] : "null",
            trafic: data[1, 2] != "" ? data[1, 2] : "null",
            flow_label: data[3, 5] != "" ? data[3, 5] : "null",
            payload_length: data[8, 4] != "" ? data[8, 4] : "null",
            next_header: data[12, 2] != "" ? data[12, 2] : "null",
            hop_limit: data[14, 2] != "" ? data[14, 2] : "null",
            source_address: data[16, 32] != "" ? data[16, 32] : "null",
            destination_address: data[48, 32] != "" ? data[48, 32] : "null",
            data: data[80..-1] != "" ? data[80..-1] : "null",
        }
    end
    @input = data
    erb :index
end

def check_v(data)
    puts data[0, 1]
    if data[0, 1].to_i == 4
        @v_flag = 4
    elsif data[0, 1].to_i == 6
        @v_flag = 6
    else
        @v_flag = -1
    end
end