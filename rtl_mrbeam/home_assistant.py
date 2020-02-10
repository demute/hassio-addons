import requests
import time
import sys
import os

class home_assistant:
    """
    docstring for block home_assistant
    """
    accessToken = None
    def __init__(self, host, port, accessToken):
        self.host = host
        self.port = port
        self.accessToken = accessToken

    def send_event (self, channel):
        tsp = time.time ()
        eventData  = { 'state': "%s_%s" % (channel, tsp), "attributes" : {"channel": channel, "tsp": tsp} }
        headerData = { 'Authorization': 'Bearer %s' % self.accessToken, 'Content-Type': 'application/json' }
        print (eventData)
        response = requests.post (url="http://%s:%s/api/states/sensor.mrbeam" % (self.host, self.port), json = eventData, headers = headerData)
        print (response)

def main():
    print (os.environ['HASSIO_TOKEN'])
    ha = home_assistant ("hassio", 8123, accessToken)
    while True:
        line = sys.stdin.readline()
        if not line: break
        channel = int (line)
        ha.send_event (channel)

if __name__=="__main__":
    main()

