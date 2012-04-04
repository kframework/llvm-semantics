; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040319-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @blah(i32 %zzz) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %zzz.addr = alloca i32, align 4
  %foo = alloca i32, align 4
  store i32 %zzz, i32* %zzz.addr, align 4
  %0 = load i32* %zzz.addr, align 4
  %cmp = icmp sge i32 %0, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 1, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %1 = load i32* %zzz.addr, align 4
  %cmp1 = icmp sge i32 %1, 0
  br i1 %cmp1, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.end
  %2 = load i32* %zzz.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.end
  %3 = load i32* %zzz.addr, align 4
  %sub = sub nsw i32 0, %3
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %2, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* %foo, align 4
  %4 = load i32* %foo, align 4
  store i32 %4, i32* %retval
  br label %return

return:                                           ; preds = %cond.end, %if.then
  %5 = load i32* %retval
  ret i32 %5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @blah(i32 -1)
  %cmp = icmp ne i32 %call, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
