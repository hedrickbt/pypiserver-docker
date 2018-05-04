# pypiserver #

[pypiserver][0] is a simple [Python][2] package for mirroring [pypi][3]
packages.

This project is a [Docker][1] container for hosting [`pypiserver`][0].

## Building ##

To build this container, you should have GNU [Make][4] installed as well as
[Docker][1].

Satisfying these requirements: simply run `make` to build the container.

## Running ##

After building or pulling an automated build of the container, you can run the
container with the following:

```
docker run --rm \
    -d \
    --publish 8080:80 \
    --volume $(pwd)/packages/:/srv/pypi/packages \
    homecu/pypiserver
```

Of course, change the `publish` and `volume` options as necessary.

### systemd service file ###

It's also possible to run the container using a [systemd][5] service file,
similar to the following:

```
[Unit]
Description=pypiserver Docker container
After=docker.service
Requires=docker.service

[Service]
TimeoutStartSec=10
Restart=always
ExecStartPre=-/usr/bin/docker stop %n
ExecStartPre=-/usr/bin/docker rm %n
ExecStartPre=/usr/bin/docker pull homecu/pypiserver:latest
ExecStart=/usr/bin/docker run --rm --name %n \
    --publish 8080:80 \
    --volume /srv/pypi/packages:/srv/pypi/packages \
    homecu/pypiserver:latest

[Install]
WantedBy=multi-user.target

```

## License ##

[pypiserver][0] is released as open source software under the terms and
conditions of the [zlib/libpng][6] and the Expat/MIT licenses.

This software is released under the Expat/MIT license.

For more details, please see the `LICENSE` file attached with your
distribution of this software.

[0]: https://github.com/pypiserver/pypiserver/

[1]: https://docker.com/

[2]: https://python.org/

[3]: https://pypi.org/

[4]: https://www.gnu.org/software/make/

[5]: https://freedesktop.org/wiki/Software/systemd/

[6]: https://www.zlib.net/zlib_license.html
