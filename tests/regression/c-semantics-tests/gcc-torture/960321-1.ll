; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/960321-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@a = global [10 x i8] c"deadbeef\00\00", align 1

define signext i8 @acc_a(i64 %i) nounwind uwtable {
entry:
  %i.addr = alloca i64, align 8
  store i64 %i, i64* %i.addr, align 8
  %0 = load i64* %i.addr, align 8
  %sub = sub nsw i64 %0, 2000000000
  %arrayidx = getelementptr inbounds [10 x i8]* @a, i32 0, i64 %sub
  %1 = load i8* %arrayidx, align 1
  ret i8 %1
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call signext i8 @acc_a(i64 2000000000)
  %conv = sext i8 %call to i32
  %cmp = icmp ne i32 %conv, 100
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
