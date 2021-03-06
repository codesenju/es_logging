#!/bin/bash
echo "====================================================="
echo "Curator started at - $(date +'%d-%m-%Y*%T')"
echo "====================================================="
docker run --rm --name curator -v /opt/devops/docker_run/es_logging/curator:/tmp --net monitor --entrypoint curator <registry>/elasticsearch-curator:5.8.4 /tmp/curator-action.yml --config /tmp/curator-conf.yml --dry-run