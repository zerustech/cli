# ZerusTech CLI #

This project provides some commonly used functions and scripts for cli
programming, such as scripts for running tasks interactively, starting and
stopping varnish server, starting and stopping php builtin server.

New functions and scripts will be added in the future.

This project is used by the [zerustech/http-cache-tutorial][2] and [zerustech/less-tutorial][3] projects.

## Directory Structure ##

The directory structure of this project is as follows:

```bash
<base>             # project base directory
  \_ bin
  |   \_ http      # http related scripts (e.g., sending http request).
  |   |_ php       # php related scripts (e.g., starting php builtin server).
  |   |_ task      # task related scripts (e.g., running tasks interactively).
  |   |_ varnish   # varnish management scripts (e.g., starting varnish server).
  |
  |_ lib           # library scripts.
  |_ var           # log and pid files

```

# References #
* [ZerusTech HTTP Cache Tutorial][2].
* [ZerusTech Less Tutorial][3].


# License #
This tutorial is published under the [MIT License][1].

[1]: https://opensource.org/licenses/MIT "The MIT License (MIT)"
[2]: https://github.com/zerustech/http-cache-tutorial
[3]: https://github.com/zerustech/less-tutorial
