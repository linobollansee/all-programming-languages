// P4 (packet processing language)
#include <core.p4>
#include <v1model.p4>

header ethernet_t {
    bit<48> dstAddr;
    bit<48> srcAddr;
    bit<16> etherType;
}

struct headers {
    ethernet_t ethernet;
}

parser MyParser(packet_in packet,
                out headers hdr) {
    state start {
        packet.extract(hdr.ethernet);
        transition accept;
    }
}
