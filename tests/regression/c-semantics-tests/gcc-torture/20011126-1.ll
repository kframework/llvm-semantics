; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20011126-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global i32 1, align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca i64, align 8
  store i32 0, i32* %retval
  %0 = load i32* @a, align 4
  %conv = sext i32 %0 to i64
  store i64 %conv, i64* %s, align 8
  %1 = load i64* %s, align 8
  %cmp = icmp slt i64 %1, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  store i64 -2147483648, i64* %s, align 8
  br label %if.end

if.else:                                          ; preds = %entry
  store i64 2147483647, i64* %s, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %2 = load i64* %s, align 8
  %cmp2 = icmp slt i64 %2, 0
  br i1 %cmp2, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
