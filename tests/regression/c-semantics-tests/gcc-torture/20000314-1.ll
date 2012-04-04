; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000314-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %winds = alloca i64, align 8
  store i32 0, i32* %retval
  store i64 0, i64* %winds, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load i64* %winds, align 8
  %cmp = icmp ne i64 %0, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load i64* %winds, align 8
  %2 = inttoptr i64 %1 to i8*
  %3 = load i8* %2, align 1
  %tobool = icmp ne i8 %3, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  br label %while.end

if.end:                                           ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  %4 = load i64* %winds, align 8
  %cmp1 = icmp eq i64 %4, 0
  br i1 %cmp1, label %if.then5, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %while.end
  %5 = load i64* %winds, align 8
  %cmp2 = icmp ne i64 %5, 0
  br i1 %cmp2, label %if.then5, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %6 = load i64* %winds, align 8
  %7 = inttoptr i64 %6 to i8*
  %8 = load i8* %7, align 1
  %conv = sext i8 %8 to i32
  %tobool4 = icmp ne i32 %conv, 0
  br i1 %tobool4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %lor.lhs.false3, %lor.lhs.false, %while.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

if.end6:                                          ; preds = %lor.lhs.false3
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @exit(i32) noreturn nounwind

declare void @abort() noreturn nounwind
