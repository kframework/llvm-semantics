; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/941031-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i64 %us, i64 %vs) nounwind uwtable {
entry:
  %us.addr = alloca i64, align 8
  %vs.addr = alloca i64, align 8
  %aus = alloca i64, align 8
  %avs = alloca i64, align 8
  %t = alloca i64, align 8
  store i64 %us, i64* %us.addr, align 8
  store i64 %vs, i64* %vs.addr, align 8
  %0 = load i64* %us.addr, align 8
  %cmp = icmp sge i64 %0, 0
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i64* %us.addr, align 8
  br label %cond.end

cond.false:                                       ; preds = %entry
  %2 = load i64* %us.addr, align 8
  %sub = sub nsw i64 0, %2
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i64 [ %1, %cond.true ], [ %sub, %cond.false ]
  store i64 %cond, i64* %aus, align 8
  %3 = load i64* %vs.addr, align 8
  %cmp1 = icmp sge i64 %3, 0
  br i1 %cmp1, label %cond.true2, label %cond.false3

cond.true2:                                       ; preds = %cond.end
  %4 = load i64* %vs.addr, align 8
  br label %cond.end5

cond.false3:                                      ; preds = %cond.end
  %5 = load i64* %vs.addr, align 8
  %sub4 = sub nsw i64 0, %5
  br label %cond.end5

cond.end5:                                        ; preds = %cond.false3, %cond.true2
  %cond6 = phi i64 [ %4, %cond.true2 ], [ %sub4, %cond.false3 ]
  store i64 %cond6, i64* %avs, align 8
  %6 = load i64* %aus, align 8
  %7 = load i64* %avs, align 8
  %cmp7 = icmp slt i64 %6, %7
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %cond.end5
  %8 = load i64* %aus, align 8
  store i64 %8, i64* %t, align 8
  %9 = load i64* %avs, align 8
  store i64 %9, i64* %aus, align 8
  %10 = load i64* %aus, align 8
  store i64 %10, i64* %avs, align 8
  br label %if.end

if.end:                                           ; preds = %if.then, %cond.end5
  %11 = load i64* %avs, align 8
  %conv = trunc i64 %11 to i32
  ret i32 %conv
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @f(i64 3, i64 17)
  %cmp = icmp ne i32 %call, 17
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
