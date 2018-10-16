#!/usr/bin/env bash

set -euo pipefail

# GEN_DIR allows to share the entrypoint between Dockerfile and run-in-docker.sh (backward compatible)
GEN_DIR=${GEN_DIR:-/opt/swagger-codegen}
JAVA_OPTS=${JAVA_OPTS:-"-Xmx1024M -Dlogback.configurationFile=conf/logback.xml"}

cli="${GEN_DIR}/modules/swagger-codegen-cli"
codegen="${cli}/target/swagger-codegen-cli.jar"
cmdsrc="${cli}/src/main/java/io/swagger/codegen/cmd"

exec java ${JAVA_OPTS} -jar "${codegen}" "$@"

