# GTNH Docker image

![GitHub License](https://img.shields.io/github/license/istoleyurballs/gtnh-docker)
![GitHub Release](https://img.shields.io/github/v/release/istoleyurballs/gtnh-docker)
![GitHub Release Date](https://img.shields.io/github/release-date/istoleyurballs/gtnh-docker)

A simple GTNH image shipped with Lazymc and rcon-cli.

I made this instead of using something like [Itzg's image](https://github.com/itzg/docker-minecraft-server) because its quite involved and poorly suited for GTNH that is just a bunch for forked mods in a zip file.
By contrast this image is very straightforward with a clear goal: GTNH bundled in the image + put the server to sleep after 20 minutes.

An example compose file is available at [compose.yml].

## Environment variables

Variables that can be set at startup, for example in a compose file.

| Name              | Description                                                           | Default value               |
|-------------------|-----------------------------------------------------------------------|-----------------------------|
| `EULA`            | Whether or not you accepted the minecraft EULA, must be set to `true` | `false`                     |
| `MOTD`            | The message of the day to display on the server list                  | `GT:New Horizons 2.8.4`     |
| `DIFFICULTY`      | The difficulty of the server, between `0` and `3`                     | `2`                         |
| `VIEW_DISTANCE`   | View distance in chunks                                               | `10`                        |
| `SEED`            | The seed to use for world generation                                  | (empty)                     |
| `INIT_MEMORY`     | Minimum amount of RAM (passed to `-Xmx`)                              | `1G`                        |
| `MAX_MEMORY`      | Maxmimum amount of RAM (passed to `-Xms`)                             | `4G`                        |
| `EXTRA_JAVA_ARGS` | Extra arguments for the JVM                                           | (empty)                     |
| `EXTRA_MC_ARGS`   | Extra arguments for the Minecraft Server                              | (empty)                     |

Note that some options work by overriding the corresponding setting in `sever.properties` just before starting the server.

To use a custom `server.properties` without it being overridden, don't set any of the `EULA`, `MOTD`, `DIFFICULTY`, `VIEW_DISTANCE` and `SEED` variables.

## Lazymc configuration

Currently the only way to configure Lazymc is via its config file, no env variables.

The image comes with a premade one that suspends the server after 20 minutes or 1 minecraft day.

You can use your own config by mounting it at `/minecraft/lazymc.toml`.

## Build variable

Variables that can be set at build time, to build for a different version, see the `release-image.sh` script for an example.

All are required unless specified.

| Name              | Description                                                                        |
|-------------------|------------------------------------------------------------------------------------|
| `LAZYMC_VERSION`  | Version of lazymc to use, must be a valid github release                           |
| `RCONCLI_VERSION` | Version of rcon-cli to use, must be a valid github release                         |
| `GTNH_VERSION`    | Version of GTNH, for example `2.8.4`                                               |
| `GTNH_VARIANT`    | Suffix of the GTNH version, usually for the java version, for example `Java_17-25` |
| `GTNH_PREFIX`     | (optional) Prefix of the file path, target use is the the `betas/` path prefix     |
