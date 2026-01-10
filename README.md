# GTNH Docker image

![GitHub License](https://img.shields.io/github/license/istoleyurballs/gtnh-docker)
![GitHub Release](https://img.shields.io/github/v/release/istoleyurballs/gtnh-docker)
![GitHub Release Date](https://img.shields.io/github/release-date/istoleyurballs/gtnh-docker)

This repository contains the tool to build a GTNH server docker image with lazync and rcon-cli installed.

An example compose file is available at [compose.yml].

## Environment variables

Variables that can be set at startup, for example in a compose file.

| Name            | Description                                                           | Default value           |
|-----------------|-----------------------------------------------------------------------|-------------------------|
| `EULA`          | Whether or not you accepted the minecraft EULA, must be set to `true` | `false`                 |
| `MOTD`          | The message of the day to display on the server list                  | `GT:New Horizons 2.8.4` |
| `DIFFICULTY`    | The difficulty of the server, between `0` and `3`                     | `2`                     |
| `VIEW_DISTANCE` | View distance in chunks                                               | `10`                    |
| `SEED`          | The seed to use for world generation                                  | ``                      |
| `INIT_MEMORY`   | Minimum amount of RAM (passed to `-Xmx`)                              | `1G`                    |
| `MAX_MEMORY`    | Maxmimum amount of RAM (passed to `-Xms`)                             | `1G`                    |

## Build variable

Variables that can be set at build time, to build for a different version.

All are required.

| Name              | Description                                                                        |
|-------------------|------------------------------------------------------------------------------------|
| `LAZYMC_VERSION`  | Version of lazymc to use, must be a valid github release                           |
| `RCONCLI_VERSION` | Version of rcon-cli to use, must be a valid github release                         |
| `GTNH_VERSION`    | Version of GTNH, for example `2.8.4`                                               |
| `GTNH_VARIANT`    | Suffix of the GTNH version, usually for the java version, for example `Java_17-25` |

