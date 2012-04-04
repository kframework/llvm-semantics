; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20040309-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @foo(i16 zeroext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  %y = alloca i16, align 2
  store i16 %x, i16* %x.addr, align 2
  %0 = load i16* %x.addr, align 2
  %conv = zext i16 %0 to i32
  %cmp = icmp sgt i32 %conv, 32767
  br i1 %cmp, label %cond.true, label %cond.false

cond.true:                                        ; preds = %entry
  %1 = load i16* %x.addr, align 2
  %conv2 = zext i16 %1 to i32
  %sub = sub nsw i32 %conv2, 32768
  br label %cond.end

cond.false:                                       ; preds = %entry
  br label %cond.end

cond.end:                                         ; preds = %cond.false, %cond.true
  %cond = phi i32 [ %sub, %cond.true ], [ 0, %cond.false ]
  %conv3 = trunc i32 %cond to i16
  store i16 %conv3, i16* %y, align 2
  %2 = load i16* %y, align 2
  %conv4 = zext i16 %2 to i32
  ret i32 %conv4
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @foo(i16 zeroext 0)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call1 = call i32 @foo(i16 zeroext 32767)
  %cmp2 = icmp ne i32 %call1, 0
  br i1 %cmp2, label %if.then3, label %if.end4

if.then3:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %if.end
  %call5 = call i32 @foo(i16 zeroext -32768)
  %cmp6 = icmp ne i32 %call5, 0
  br i1 %cmp6, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end4
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end4
  %call9 = call i32 @foo(i16 zeroext -32767)
  %cmp10 = icmp ne i32 %call9, 1
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end8
  %call13 = call i32 @foo(i16 zeroext -1)
  %cmp14 = icmp ne i32 %call13, 32767
  br i1 %cmp14, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end12
  ret i32 0
}

declare void @abort() noreturn nounwind
