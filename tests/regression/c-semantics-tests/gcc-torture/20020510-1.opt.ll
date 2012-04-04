; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020510-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @testc(i8 zeroext %c, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i8 %c, 0
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end9

if.then5:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end9, label %if.then7

if.then7:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.then, %if.else
  ret void
}

declare void @abort() noreturn nounwind

define void @tests(i16 zeroext %s, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i16 %s, 0
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end9

if.then5:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end9, label %if.then7

if.then7:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.then, %if.else
  ret void
}

define void @testi(i32 %i, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i32 %i, 0
  %tobool = icmp ne i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end6, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else, %if.then
  ret void
}

define void @testl(i64 %l, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i64 %l, 0
  %tobool = icmp ne i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end6, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then4, label %if.end6

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.else, %if.then
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
