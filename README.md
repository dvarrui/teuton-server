
# Teuton Server

## Introduction

[Teuton](https://github.com/teuton-software/teuton) is an infrastructure test application installed into host called T-NODE. T-NODE user monitorize remote S-NODE users machines.

When a S-NODE user X wants to be tested, must wait until T-NODE user launch Teuton test unit.

## Teuton Server software

First, Teuton server is installed into T-NODE and S-NODE.

Then, T-NODE user configure and init Teuton Server so remote machine S-NODE users can make requests.

This way, S-NODE host is evaluated by the server at any time without T-NODE user intervention.

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

* `teuton-server ` runs Teuton Server:

```
teuton-server => Starting...
                Configfile : ./server.yaml
                Listen on  : 127.0.0.1:16000
                Test list  : testname01
                (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...

```

# Running Teuton Client

From S-NODE host:
* `teuton-client localhost 16001`, user makes request:

```
teuton-client => Waiting...   localhost:16001 (teuton-server)
             => Connection : 127.0.0.1:16001 -> 127.0.0.1:34080
             => Timestamp  : 2019-11-06 19:06:22 +0000
             => Action     : teuton play --quiet --case=1 ./testname01
             => Grade      : FAIL!
```

> In this example, action failed because test name dosn't exist.
