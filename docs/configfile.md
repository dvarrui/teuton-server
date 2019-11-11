
# Config file

When TeutonServer starts need to read a configuration file.

## Creating config file

* `teuton-server init`, create TeutonServer configuration file in current directory, called `teuton-server.yaml`

Let's see its content:

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

* It's posible create this file by hand.

## Config file params

| Section | Param     | Description               |
| ------- | --------- | ------------------------- |
| server  | ip        | Server listening IP |
|         | port      | Server listen on PORT+1, PORT+2, etc. |
|         | testunits | List of Teuton test units names |
| clients |           | List of clients: 1, 2, etc. |
|         | members   | Client name               |
|         | ip        | CLient IP                 |

## Param description

* **server/port**: Base port for services.
    * `:port: 16000`, client 1 is asigned port 16001, client 2 is assigned 16002 port, and so on.
* **clients**: TeutonServer will attend only the specified clients.
* **clients/members**: Client name or names
* **client/ip**: Server only accepts client request from this IP.
    * `:ip: :allow`, client request are allowed always.
    * `:ip: :deny`, client request are denied always.
    * `:ip: 192.168.1.200`, client request are only accepted from 192.168.1.200 IP.
