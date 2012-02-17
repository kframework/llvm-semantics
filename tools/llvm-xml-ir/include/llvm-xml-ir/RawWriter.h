#ifndef RAW_WRITER_H_
#define RAW_WRITER_H_

#include "llvm-xml-ir/XMLIROStream.h"
#include <llvm/ADT/StringRef.h>

// TODO: the OStream argument should probably come first
// TODO: should this be a "static" class?

class RawWriter {
public:
  static void write(const char *, XMLIROStream &);
  static void write(llvm::StringRef, XMLIROStream &);
  static void write(std::string, XMLIROStream &);
  static void write(int, XMLIROStream &);
  static void writeRawString(std::string, XMLIROStream &);
  static void writeRawBase64(std::string, XMLIROStream &);
  static void writeRawInt(int, XMLIROStream &);
  static void writeRawInt(std::string, XMLIROStream &);
};

#endif
