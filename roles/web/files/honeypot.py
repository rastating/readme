import signal
import socket
import sys
import time

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.bind(('', 3306))
s.listen(0)

def sigterm_handler(signal, frame):
    s.close()
    sys.exit(0)

signal.signal(signal.SIGTERM, sigterm_handler)

while True:
    try:
        c, addr = s.accept()

        greeting =  "\x46\x00\x00\x00\xff\x6a\x04\x48\x6f\x73\x74\x20\x27"
        greeting += addr[0]
        greeting += "\x27\x20\x69\x73\x20\x6e"
        greeting += "\x6f\x74\x20\x61\x6c\x6c\x6f\x77\x65\x64\x20\x74\x6f\x20\x63\x6f"
        greeting += "\x6e\x6e\x65\x63\x74\x20\x74\x6f\x20\x74\x68\x69\x73\x20\x4d\x79"
        greeting += "\x53\x51\x4c\x20\x73\x65\x72\x76\x65\x72"

        c.send(greeting)
        c.close()
    except Exception, e:
        print str(e)
    except KeyboardInterrupt:
        sigterm_handler(signal.SIGTERM, {})
