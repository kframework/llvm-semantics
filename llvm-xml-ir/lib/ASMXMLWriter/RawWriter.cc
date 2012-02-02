#include "llvm-xml-ir/XMLIROStream.h"
#include "llvm-xml-ir/RawWriter.h"
#include "base64encode.h"

#include <llvm/ADT/StringRef.h>

using namespace llvm;

void RawWriter::write(StringRef str, XMLIROStream & Out) {
  write(str.str(), Out);
}

void RawWriter::write(std::string str, XMLIROStream & Out) {
  bool UseBase64 = false;

  std::string::iterator it;
  for (it = str.begin(); it < str.end(); it++) {
    char c = *it;
    if (!isalnum(c) && !ispunct(c) && c != ' ') {
      UseBase64 = true;
      break;
    }
    if (c == '<' || c == '>' || c == '&') {
      UseBase64 = true;
      break;
    }
  } 

  if (UseBase64) {
    writeRawBase64(str, Out);
  } else {
    writeRawString(str, Out);
  }
}

void RawWriter::write(int i, XMLIROStream & Out) {
  writeRawInt(i, Out);
}

void RawWriter::writeRawString(std::string str, XMLIROStream & Out) {
  Out << "<RawString>";
  Out << str;
  Out << "</RawString>\n";
}

void RawWriter::writeRawBase64(std::string str, XMLIROStream & Out) {
  int datalen = str.size();
  char encoded[2 * datalen];
  int enclen = base64_encode((const uint8_t *) str.data(), datalen, encoded);
  encoded[enclen] = '\0';

  Out << "<RawBase64>";
  Out << encoded;
  Out << "</RawBase64>\n";
}

void RawWriter::writeRawInt(int i, XMLIROStream & Out) {
  Out << "<RawInt>";
  Out << i;
  Out << "</RawInt>\n";
}

void RawWriter::writeRawInt(std::string str, XMLIROStream & Out) {
  Out << "<RawInt>";
  Out << str;
  Out << "</RawInt>\n";
}
