#!/usr/bin/env python


import sys
import unittest
from gprof2dot.gprof2dot import DotWriter

if sys.version_info[0] == 3:
    unicode = str
else:
    bytes = str

class StringTests(unittest.TestCase):
    def test_BaseString(self):
        bs = b'test string'
        dw = DotWriter(None)
        out = dw.escape(bs)
        assert isinstance(out, bytes)

    def test_UnicodeString(self):
        us = unicode("test string\\u8034")
        dw = DotWriter(None)
        out = dw.escape(us)
        assert isinstance(out, bytes)

if __name__ == "__main__":
    unittest.main()