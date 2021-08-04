FROM sphinxdoc/sphinx

WORKDIR /docs

COPY .. /
ENV PBR_VERSION=5.6.0
RUN cat /docs/Makefile
RUN pip3 install -r /docs/requirements.txt

RUN cd /docs && make html

FROM bitnami/apache:latest

COPY --from=0 /docs/build/html /app


