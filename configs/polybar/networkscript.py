#!/usr/bin/env python3
import os
import argparse
import speedtest

def get_formatted_speed(s,bytes=False):
    unit = ""
    if s > 1024**3:
        s = s / 1024**3
        unit = "G"
    elif s > 1024**2:
        s = s / 1024**2
        unit = "M"
    elif s > 1024:
        s = s / 1024
        unit = "K"
    if bytes:
        return f"{(s/8):.2f} {unit}iB/s"
    return f"{s:.2f} {unit}ib/s"
    


parser = argparse.ArgumentParser()
parser.add_argument('--upload', action="store_true")
parser.add_argument('--bytes', action="store_true")
args= parser.parse_args()

try:
    s = speedtest.Speedtest()
except:
    exit(0)

if args.upload:
    s.upload(pre_allocate=False)
    print(" " + get_formatted_speed(s.results.upload,args.bytes))
else:
    s.download()
    print(" " + get_formatted_speed(s.results.download,args.bytes))