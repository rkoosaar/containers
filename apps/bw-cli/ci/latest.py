#!/usr/bin/env python

import requests

def get_latest(channel):
    # Get the latest Bitwarden CLI release version
    url = "https://api.github.com/repos/bitwarden/clients/releases"
    headers = {"Accept": "application/vnd.github+json"}
    response = requests.get(url, headers=headers)
    if response.status_code != 200:
        raise Exception("Failed to get latest Bitwarden CLI release version")

    data = response.json()
    releases = sorted(data, key=lambda release: release["published_at"], reverse=True)
    cli_release = next(release for release in releases if "CLI" in release["name"])
    version = cli_release["name"].split("CLI v")[1]
    return version

if __name__ == "__main__":
    import sys
    channel = sys.argv[0]
    print(get_latest(channel))
