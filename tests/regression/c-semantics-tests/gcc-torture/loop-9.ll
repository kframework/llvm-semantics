; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/loop-9.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @false() nounwind uwtable {
entry:
  ret i32 0
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %count = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %count, align 4
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %call = call i32 @false()
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %lor.end, label %lor.rhs

lor.rhs:                                          ; preds = %while.cond
  %0 = load i32* %count, align 4
  %cmp = icmp slt i32 %0, -123
  br label %lor.end

lor.end:                                          ; preds = %lor.rhs, %while.cond
  %1 = phi i1 [ true, %while.cond ], [ %cmp, %lor.rhs ]
  br i1 %1, label %while.body, label %while.end

while.body:                                       ; preds = %lor.end
  %2 = load i32* %count, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %count, align 4
  br label %while.cond

while.end:                                        ; preds = %lor.end
  %3 = load i32* %count, align 4
  %tobool1 = icmp ne i32 %3, 0
  br i1 %tobool1, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  ret i32 0
}

declare void @abort() noreturn nounwind
