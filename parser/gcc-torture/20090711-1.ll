; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20090711-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i64 @div(i64 %val) nounwind uwtable noinline {
entry:
  %val.addr = alloca i64, align 8
  store i64 %val, i64* %val.addr, align 8
  %tmp = load i64* %val.addr, align 8
  %div = sdiv i64 %tmp, 32768
  ret i64 %div
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %d1 = alloca i64, align 8
  %d2 = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 -990000000, i64* %d1, align 8
  %tmp = load i64* %d1, align 8
  %call = call i64 @div(i64 %tmp)
  store i64 %call, i64* %d2, align 8
  %tmp1 = load i64* %d2, align 8
  %cmp = icmp ne i64 %tmp1, -30212
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret i32 0
}

declare void @abort() noreturn
