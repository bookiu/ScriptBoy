#!/bin/bash
# description: 将pcap文件分割
# tags: tshark, bash, editcap

# 将pcap文件按40s一个文件分割
editcap -i 40 /path/to/original.pcap split.pcap
