#!/bin/sed -urf
# -*- coding: UTF-8, tab-width: 2 -*-

1{
  \| YAML Lint failed for /dev/stdin$|d
  s~ YAML Lint successful\.$~ ok~
}
