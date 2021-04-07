#!/bin/sh

csplit -z -f battery_ -b '%d.xpm' --suppress-matched battery '/^>/' '{*}'
csplit -z -f charging_ -b '%d.xpm' --suppress-matched charging '/^>/' '{*}'
csplit -z -f wireless_ -b '%d.xpm' --suppress-matched wireless '/^>/' '{*}'
