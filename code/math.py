#!/usr/bin/env python

from pandocfilters import toJSONFilter, RawInline, stringify
import re

align = re.compile("\\\\begin{align}")


def math(k, v, f, meta):
    if k == 'Math' and f == 'latex' and re.search(align, v[1]):
        return RawInline('latex', v[1])


if __name__ == "__main__":
    toJSONFilter(math)
