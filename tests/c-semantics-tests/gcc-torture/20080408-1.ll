; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080408-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %ssi = alloca i16, align 2
  %usi = alloca i16, align 2
  %fail = alloca i32, align 4
  store i32 0, i32* %retval
  store i16 126, i16* %ssi, align 2
  store i16 -256, i16* %usi, align 2
  %0 = load i16* %ssi, align 2
  %conv = sext i16 %0 to i32
  %1 = load i16* %usi, align 2
  %conv1 = zext i16 %1 to i32
  %cmp = icmp slt i32 %conv, %conv1
  %lnot = xor i1 %cmp, true
  %lnot.ext = zext i1 %lnot to i32
  store i32 %lnot.ext, i32* %fail, align 4
  %2 = load i32* %fail, align 4
  %tobool = icmp ne i32 %2, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn nounwind
