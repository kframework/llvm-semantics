; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990531-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.anon = type { i64 }

define i64 @bad(i32 %reg, i64 %inWord) nounwind uwtable {
entry:
  %reg.addr = alloca i32, align 4
  %inWord.addr = alloca i64, align 8
  %data = alloca %union.anon, align 8
  store i32 %reg, i32* %reg.addr, align 4
  store i64 %inWord, i64* %inWord.addr, align 8
  %0 = load i64* %inWord.addr, align 8
  %word = bitcast %union.anon* %data to i64*
  store i64 %0, i64* %word, align 8
  %1 = load i32* %reg.addr, align 4
  %idxprom = sext i32 %1 to i64
  %byte = bitcast %union.anon* %data to [4 x i8]*
  %arrayidx = getelementptr inbounds [4 x i8]* %byte, i32 0, i64 %idxprom
  store i8 0, i8* %arrayidx, align 1
  %word1 = bitcast %union.anon* %data to i64*
  %2 = load i64* %word1, align 8
  ret i64 %2
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
