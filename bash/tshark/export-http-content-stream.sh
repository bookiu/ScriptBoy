#!/bin/bash
# description: 从pcap文件中提取包含特定字符串的http请求strem
# tags: tshark, wireshark, bash, array

pcap_file=""

declare -a request_ids=("48f4b23cb0ca418c81e307a096d0a317" "c2ddd99b58194aaeb9f240ff14517629" "82a36ca13f5d4a79a3bfca60bd08b4e8" "dd0b695925e84c92a7c604506d24c29e" "0e16b91a2226497e820664a47fc3d6a3" "94d0a8d6a50344d8b307ad15e0ab35ad" "a24750e8527b479081dca285e2583949" "38e9ae10ec0b44039583995988159a38" "63a45c69412e43f19f5f80525a23e24a" "44aaf9b83bb24fed9f81d3bfcc0af605")

for rid in "${request_ids[@]}"; do
    idx=0
    for sid in $(tshark -r $pcap_file -Y 'http contains "'$rid'"' -e tcp.stream -T fields 2> /dev/null | sort | uniq); do
        echo "start to export tcp.stream==$sid"
        tshark -r $pcap_file -Y "tcp.stream==${sid}" -w request_honor_${rid}_${idx}.pcap
        ((idx++))
    done
done
