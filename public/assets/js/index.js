let inputElement = document.querySelector("form input");

function splitData() {
    let data = inputElement.value;

};

inputElement.addEventListener("click", function() {
    splitData;
});

class Data {
    constructor() {
        this.version = 0;
        this.length = 0;
        this.service_type = 0;
        this.packet_length = 0;
        this.identificatipn = 0;
        this.flagment = 0;
        this.ttl = 0;
        this.transport = 0;
        this.header_checksum = 0;
        this.source_ip_address = 0;
        this.destination_ip_address = 0;
        this.options = 0;
        this.padding = 0;
        this.data = 0;
    };
};