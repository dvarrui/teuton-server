
# Teuton Server

## Introduction

[Teuton](https://github.com/teuton-software/teuton) is an infrastructure test application installed into host called T-NODE. T-NODE user monitorize remote S-NODE users machines.

When a S-NODE user X wants to be tested, must wait until T-NODE user launch Teuton test unit.


## Installation 

`gem install teuton-server`

> Teuton Software must be installed before start TeutonServer

## Teuton Server software

First, Teuton server is installed into T-NODE.

Then, T-NODE user configure and init Teuton Server, so remote machine S-NODE users can make requests.

Doing this way, S-NODE host is evaluated by the server at any time without T-NODE user intervention.

---
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
                Configfile : ./server.yaml
                Listen on  : 127.0.0.1:16000
                Test list  : testname01
                (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...

```

Now we can send requests to server using Teuton Client.

