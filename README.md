# tf.sh - Terraform State in Git

    2019 Ondrej Sika <ondrej@ondrejsika.com>
    https://github.com/ondrejsika/tf.sh

## Install

Download scripts to your repository & commit them.

```
curl -o tf.sh https://raw.githubusercontent.com/ondrejsika/tf.sh/master/tf.sh && \
  curl -o setup-tf.sh https://raw.githubusercontent.com/ondrejsika/tf.sh/master/setup-tf.sh && \
  chmod +x tf.sh && \
  chmod +x setup-tf.sh
```

Ignore `.state` in `.gitignore`.

```
echo .state >> .gitignore
```

Create config `.tf.env.sh` form example [.tf.env.example.sh](.tf.env.example.sh)

__Commit__ those changes into repository.

## Setup Git Repository for State (and Move Actual State There)

Doesn't matter If you have some state or if you start from scratch.

You can set up remote repository in `.tf.env.sh` or use it as param of `./setup-tf.sh` script.

This script clone repository for your state to `.state` folder, move there actual state files (`terraform.tfstate` and `terraform.tfstate.backup`) if exist. Then creates links for those state files into state repository.

You have to remove `terraform.tfstate` and `terraform.tfstate.backup` from `.gitignore`, you want to commit those links.

## Usage

Instead of `terraform`, you have to use `./tf.sh` with same argument you use with standart command.

For example:

```
./tf.sh init
./tf.sh apply
```
