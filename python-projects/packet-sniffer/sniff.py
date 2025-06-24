#!/usr/bin/env python3

import socket
# from scapy.all import *
from scapy.layers.l2 import Ether

sniffer_socket = socket.socket(socket.AF_INET, socket.SOCK_RAW, socket.ntohs(1))

interface = "eth0"

sniffer_socket.bind((interface, 0))

try:
    while True:
        raw_data, addr = sniffer_socket.recvfrom(65535)
        packet = Ether(raw_data)
        print(packet.summary())
except KeyboardInterrupt:
    sniffer_socket.close()


