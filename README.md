
# Teuton Server

## Introduction

[Teuton Software](https://github.com/teuton-software/teuton) is an infrastructure test application, that is installed into host called T-NODE. T-NODE user monitorize remote S-NODE users machines using [Teuton Software](https://github.com/teuton-software/teuton).

When a S-NODE user wants to be tested, must wait until T-NODE user launch manually Teuton test units.

But with TeutonServer, T-NODE host listen to evaluation requests from S-NODE hosts directly.

## Installation

`gem install teuton-server`

> Ensure Teuton Software is installed before start TeutonServer

# Running Teuton Server

* `teuton-server init`, create Teuton Server configuration file on T-NODE host.
* Change `server.yaml` configurations (server IP, testunits names, clients IP, etc):

```
---
:server:
 :ip: 127.0.0.1
 :port: 16000
 :testunits:
   - testname01
:clients:
- :members: client01
 :ip: 127.0.0.1
```

* `teuton-server ` runs Teuton Server into T-NODE host:

```
teuton-server => Starting...
                Configfile : ./teuton-server.yaml
                Listen on  : 127.0.0.1:16000
                Test list  : testname01
                (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...

```

Now we can send requests to server from S-NODE hosts, using Teuton Client.
