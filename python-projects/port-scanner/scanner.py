#!/usr/bin/env python3

import socket
import subprocess
import datetime

input_target = input("IP: ")

def port_scan(target):
    try:
        ip = socket.gethostbyname(target)
        print(f"Scanning target {ip}")
        print("Time Started: ", datetime.datetime.now().strftime("%A %B %d %I:%M:%S %p"))
        print(" ")
        for port in range(20, 8306):
            sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
            sock.settimeout(1)
            result = sock.connect_ex((ip, port))
            if result == 0:
                print("Port {}: Open".format(port))
    except socket.gaierror:
        print("Hostname could not be resolved")
    except socket.error:
        print("Could not connect to the server")

    print("\nTime Ended: ", datetime.datetime.now().strftime("%A %B %d %I:%M:%S %p"))

port_scan(input_target)
#192.168.1.254