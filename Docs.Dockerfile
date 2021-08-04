FROM sphinxdoc/sphinx

WORKDIR /docs

COPY .. /
ENV PBR_VERSION=5.6.0
RUN pip3 install -r /docs/requirements.txt
RUN reno --rel-notes-dir releasenotes report

RUN cd /docs && make html

FROM bitnami/apache:latest

COPY --from=0 /docs/build/html /app


