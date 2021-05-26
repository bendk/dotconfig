#!/bin/sh

set -ex

mkdir -p ~/.ssh
ln -sf ~/.config/ssh/config ~/.ssh/config
