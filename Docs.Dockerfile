FROM sphinxdoc/sphinx

WORKDIR /docs

COPY . /
# Copy git for reno to analyze commit by tags
COPY .git/ ./.git
ENV PBR_VERSION=5.6.0
RUN pip3 install -r /docs/requirements.txt
RUN reno --rel-notes-dir / report

RUN cd /docs && make html

FROM bitnami/apache:latest
COPY --from=0 /docs/build/html /app