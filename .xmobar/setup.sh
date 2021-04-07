#!/bin/sh

csplit -z -f battery_ -b '%d.xbm' --suppress-matched battery '/^>/' '{*}'
csplit -z -f charging_ -b '%d.xbm' --suppress-matched charging '/^>/' '{*}'
csplit -z -f wireless_ -b '%d.xbm' --suppress-matched wireless '/^>/' '{*}'
