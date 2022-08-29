#!/usr/bin/env sh
# abort on errors
set -e
PROJECT_DIRECTORY=`pwd`
source ./bin/_message-printer.sh
# status "Swith to package directory"
cd ..
mkdir -p blog-packages ## Create directory if not exist
cd blog-packages
warning "Cloning halal packages into $PWD"
if ([ ! -d "blog-api" ]) then
    git clone https://github.com/sakhawathossensadi/blog-api.git
    status 'blog-api package is cloned'
fi
if ([ ! -d "auth-api" ]) then
    git clone https://github.com/sakhawathossensadi/auth.git
    status 'auth-api package is cloned'
fi
status "Packages cloning is completed"
# status "Switching to project directory $PROJECT_DIRECTORY"
cd $PROJECT_DIRECTORY
BRANCH_NAME="dev-local"
git checkout $BRANCH_NAME
composer update