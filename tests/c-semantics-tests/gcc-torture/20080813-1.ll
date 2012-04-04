; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080813-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @foo(i16 zeroext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  %y = alloca i8, align 1
  store i16 %x, i16* %x.addr, align 2
  store i8 -1, i8* %y, align 1
  %0 = load i16* %x.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i8* %y, align 1
  %conv1 = sext i8 %1 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define void @bar(i16 zeroext %x) nounwind uwtable {
entry:
  %x.addr = alloca i16, align 2
  %y = alloca i8, align 1
  store i16 %x, i16* %x.addr, align 2
  store i8 -1, i8* %y, align 1
  %0 = load i16* %x.addr, align 2
  %conv = zext i16 %0 to i32
  %1 = load i8* %y, align 1
  %conv1 = zext i8 %1 to i32
  %cmp = icmp eq i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @foo(i16 zeroext -1)
  call void @bar(i16 zeroext -1)
  ret i32 0
}
