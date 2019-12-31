#!/bin/sh

cd "$(dirname $0)"

[ -f .tf.env.sh ] && \
  . .tf.env.sh

git -C .state pull origin master

if [ -f ".state/lock" ] ; then
  echo "ERR: terraform state is locked (see https://err.li/tf.sh/state-is-locked)" >&2
  exit 1
fi

touch .state/lock && \
  git -C .state add . && \
  git -C .state commit -m "[terraform] lock state" $GIT_COMMIT_FLAGS && \
  git -C .state push origin master && \
  terraform $@

rm .state/lock && \
  git -C .state add . && \
  git -C .state commit -m "[terraform] update & unlock state" $GIT_COMMIT_FLAGS && \
  git -C .state push origin master
