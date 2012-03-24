//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#include "llvm-dis-xml/XMLIROStream.h"

using namespace llvm;

XMLIROStream::XMLIROStream(raw_ostream & out)
    : m_out(out)
{}

XMLIROStream::~XMLIROStream() {
  flush();
}
