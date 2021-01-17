#!/bin/sh

set -e

bin/rails db:create db:migrate

bin/rails s -b 0.0.0.0 -p 3000

cat;
