#!/usr/bin/env nix-shell
#! nix-shell -i bash -p httrack
#
# TODO:
#  - write a script to automate the login (POST to login page, save cookies to
#    cookies.txt)
#

domain_name="primaldiet.net"

rm -rf index.html hts-cache

httrack "https://www.${domain_name}" \
    -O ./site \
    '-*feed*' \
    '-*wp-json*' \
    '-*wp-login*' \
    -N1005 \
    --advanced-progressinfo \
    --can-go-up-and-down \
    --display \
    --keep-alive \
    --mirror \
    --robots=0 \
    --user-agent='Mozilla/5.0 (X11;U; Linux i686; en-GB; rv:1.9.1) Gecko/20090624 Ubuntu/9.04 (jaunty) Firefox/3.5' \
    --verbose
