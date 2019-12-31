#!/bin/sh

cd "$(dirname $0)"

[ -f .tf.env.sh ] && \
  . .tf.env.sh

STATE_REPO_REMOTE=${1:-$STATE_REPO_REMOTE}

[ ! -d .state ] && \
  git clone $STATE_REPO_REMOTE .state

[ -f terraform.tfstate ] && \
  mv terraform.tfstate .state/terraform.tfstate || \
    touch .state/terraform.tfstate
[ -f terraform.tfstate.backup ] && \
  mv terraform.tfstate.backup .state/terraform.tfstate.backup || \
    touch .state/terraform.tfstate.backup

ln -s .state/terraform.tfstate .
ln -s .state/terraform.tfstate.backup .
