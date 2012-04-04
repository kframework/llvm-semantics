; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950512-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f1(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 0
  %conv = zext i1 %cmp to i32
  %sub = sub i32 %conv, 3
  %div = udiv i32 %sub, 2
  ret i32 %div
}

define i64 @f2(i32 %x) nounwind uwtable {
entry:
  %x.addr = alloca i32, align 4
  store i32 %x, i32* %x.addr, align 4
  %0 = load i32* %x.addr, align 4
  %cmp = icmp ne i32 %0, 0
  %conv = zext i1 %cmp to i32
  %conv1 = sext i32 %conv to i64
  %sub = sub i64 %conv1, 3
  %div = udiv i64 %sub, 2
  ret i64 %div
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 (...)* bitcast (i32 (i32)* @f1 to i32 (...)*)(i32 1)
  %cmp = icmp ne i32 %call, 2147483647
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 (...)* bitcast (i32 (i32)* @f1 to i32 (...)*)(i32 0)
  %cmp2 = icmp ne i32 %call1, 2147483646
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i64 (...)* bitcast (i64 (i32)* @f2 to i64 (...)*)(i32 1)
  %cmp6 = icmp ne i64 %call5, 9223372036854775807
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i64 (...)* bitcast (i64 (i32)* @f2 to i64 (...)*)(i32 0)
  %cmp10 = icmp ne i64 %call9, 9223372036854775806
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn
  unreachable

if.end12:                                         ; preds = %if.end8
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
