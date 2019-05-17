FROM python:3.6.8

COPY requirements.txt /tmp/requirements.txt
RUN pip install --require-hashes -r /tmp/requirements.txt \
    && rm /tmp/requirements.txt

VOLUME /srv/pypi/packages

EXPOSE 80

ENTRYPOINT ["pypi-server", "--port", "80", "/srv/pypi/packages"]
