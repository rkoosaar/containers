#!/usr/bin/env python

import requests
import json

# Get the latest version of Alpine Linux

URL = "https://registry.hub.docker.com/v2/repositories/library/alpine/tags?ordering=name&name="

def get_latest(channel):
    r = requests.get(URL + channel)
    data = json.loads(r.text)
    for tag in data['results']:
        if channel in tag['name']:
            return tag['name']

if __name__ == "__main__":
    import sys
    channel = sys.argv[1]
    print(get_latest(channel))
