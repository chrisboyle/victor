#!/bin/sh
set -e

BOOTSTRAP_VERSION="5.0.0-beta3"
BOOTSTRAP_IN="https://cdn.jsdelivr.net/npm/bootstrap@$BOOTSTRAP_VERSION/dist/css/bootstrap.min.css"
BOOTSTRAP_OUT=assets/css/bootstrap-$BOOTSTRAP_VERSION.min.css

if [ ! -f $BOOTSTRAP_OUT ]; then
  curl --create-dirs -o "$BOOTSTRAP_OUT" "$BOOTSTRAP_IN"
fi

#hugo mod get -u
