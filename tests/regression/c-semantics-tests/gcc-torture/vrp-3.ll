; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/vrp-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @f(i32 %a) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  %0 = load i32* %a.addr, align 4
  %cmp = icmp slt i32 %0, 12
  br i1 %cmp, label %if.then, label %if.end7

if.then:                                          ; preds = %entry
  %1 = load i32* %a.addr, align 4
  %cmp1 = icmp sgt i32 %1, -15
  br i1 %cmp1, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  %2 = load i32* %a.addr, align 4
  %cmp3 = icmp sgt i32 %2, 0
  br i1 %cmp3, label %cond.true, label %cond.false

cond.true:                                        ; preds = %if.then2
  %3 = load i32* %a.addr, align 4
  br label %cond.end

cond.false:                                       ; preds = %if.then2
  %4 = load i32* %a.addr, align 4
  %sub = sub nsw i32 0, %4
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %3, %cond.true ], [ %sub, %cond.false ]
  store i32 %cond, i32* %a.addr, align 4
  %5 = load i32* %a.addr, align 4
  %cmp4 = icmp eq i32 %5, 2
  br i1 %cmp4, label %if.then5, label %if.end

if.then5:                                         ; preds = %cond.end
  store i32 0, i32* %retval
  br label %return

if.end:                                           ; preds = %cond.end
  store i32 1, i32* %retval
  br label %return

if.end6:                                          ; preds = %if.then
  br label %if.end7

if.end7:                                          ; preds = %if.end6, %entry
  store i32 1, i32* %retval
  br label %return

return:                                           ; preds = %if.end7, %if.end, %if.then5
  %6 = load i32* %retval
  ret i32 %6
}

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %call = call i32 @f(i32 -2)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
