//===----------------------------------------------------------------------===//
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//


#ifndef LLVM_XML_IR_XML_FORMATTED_STREAM_H_
#define LLVM_XML_IR_XML_FORMATTED_STREAM_H_

#include <llvm/Support/raw_ostream.h>

namespace llvm {
class Type;
}

class XMLIROStream : public llvm::raw_ostream {
 public:
  XMLIROStream(llvm::raw_ostream & out);
  ~XMLIROStream();

 private:
  virtual void write_impl(const char *Ptr, size_t Size) {
    m_out.write(Ptr, Size);
  }
  virtual uint64_t current_pos() const { 
    // This has the same effect as calling TheStream.current_pos(),
    // but that interface is private.
    return m_out.tell() - m_out.GetNumBytesInBuffer();
  }

  llvm::raw_ostream & m_out;
};

#endif
