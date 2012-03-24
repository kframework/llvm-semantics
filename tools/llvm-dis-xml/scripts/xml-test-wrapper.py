#!/usr/bin/env python
#
# Usage: argv[0] llvm-xml-dis-executable clang-executable params
#
#
# This file is distributed under the University of Illinois Open Source
# License. See LICENSE.TXT for details.
#

import sys
import os
import subprocess

if len(sys.argv) < 3:
    sys.exit(2)

use_tidy = "USE_TIDY" in os.environ

clang_params = sys.argv[2:]
llvm_xml_dis_params = [sys.argv[1], "-", "-o", "-"]

tidy_param = ["/usr/bin/tidy", "-xml"]
clang_result = subprocess.Popen(clang_params, stdout=subprocess.PIPE)
llvm_xml_result = subprocess.Popen(llvm_xml_dis_params, stdin=clang_result.stdout, stdout=subprocess.PIPE)

if use_tidy:
    tidy_result = subprocess.Popen(tidy_param, stdin=llvm_xml_result.stdout)
    sys.exit(tidy_result.returncode)
else:
    sys.exit(llvm_xml_result.returncode)
