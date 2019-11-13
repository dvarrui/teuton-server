
# Starting teutonServer

Resume:

* Default config file into current directory
    * Command: `teuton-server`
    * Configfile: `teuton-sever.yaml`
* Default config file into `foo` directory:
    * Command: `teuton-server foo`
    * Configfile: `teuton-server.yaml`
* Config file into `foo` directory:
    * Command: `teuton-server foo/config.yaml`
    * Configfile: `foo/config.yaml`
* Config file into `foo` directory and force server listening IP to X.X.X.X.
    * Command: `teuton-server foo/config.yaml X.X.X.X`
    * Configfile: `foo/config.yaml`

## Default config file

By default, TeutonServer use `teuton-server.yaml` config file.

* Command `teuton-server`
* Example:

```
teuton-server => Starting...
                 Configfile : teuton-server.yaml
                 Listen on  : 127.0.0.1:16000
                 Test list  : testname01
                 (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...
```

When default config file is not into our current directory, we specify that folder.

* Command `teuton-server projects`
* Example:

```
teuton-server => Starting...
                 Configfile : projects/teuton-server.yaml
                 Listen on  : 127.0.0.1:16000
                 Test list  : testname01
                 (CTRL+C to exit)
teuton-server => service [1] listening on '16001'..
```

## Select config file

Also, it's posible choose your own TeutonServer config file.

* Command `teuton-server PATH/TO/CONFIGFILE.yaml`
* Example:

```
teuton-server => Starting...
                 Configfile : projects/server.yaml
                 Listen on  : 127.0.0.1:16000
                 Test list  : testname01
                 (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...
```

## Force listening IP on fly

TeutonServer reads params from config file, but it's posible to overwrite listen IP server on fly.

* Command `teuton-server projects/server.yaml 192.168.1.16`
* Example:

```
teuton-server => Starting...
                 Configfile : projects/server.yaml
                 Listen on  : 192.168.1.16:16000
                 Test list  : testname01
                 (CTRL+C to exit)
teuton-server => service [1] listening on '16001'...
```
