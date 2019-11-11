
# Teuton Server

[Teuton Software](https://github.com/teuton-software/teuton) is an infrastructure test application, that is installed into host called T-NODE. T-NODE user monitorize remote S-NODE users machines using [Teuton Software](https://github.com/teuton-software/teuton).

When a S-NODE user wants to be tested, must wait until T-NODE user launch manually Teuton test units.

But with TeutonServer, T-NODE host listen to evaluation requests from S-NODE hosts directly.

## Installation

* Then `gem install teuton-server`, to install TeutonServer.

> Ensure [Teuton Software](https://github.com/teuton-software/teuton) is installed too.

## Running

* `teuton-server init`, create Teuton Server configuration file on T-NODE host.
* Personalize `teuton-server.yaml` configurations (server IP, testunits names, clients IP, etc).
* `teuton-server` runs Teuton Server into T-NODE host.

> Now we can send requests to TeutonServer from S-NODE hosts, using [Teuton Client](https://github.com/dvarrui/teuton-client).

## Documentation

* [Installation](docs/installation.md)
* [Start TeutonServer](docs/start.md)
* [Configuration file](docs/configfile.md)
