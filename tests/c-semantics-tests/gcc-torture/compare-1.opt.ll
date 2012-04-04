; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/compare-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @ieq(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp eq i32 %x, %y
  %tobool3 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool3, label %if.then2, label %if.end42

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool3, label %if.end42, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end42:                                         ; preds = %if.else, %if.then
  ret i32 0
}

declare void @abort() noreturn nounwind

define void @ine(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp eq i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.then, %if.else
  ret void
}

define i32 @ilt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp slt i32 %x, %y
  %tobool3 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool3, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.then, %if.else
  ret i32 0
}

define i32 @ile(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.then, %if.else
  ret i32 0
}

define i32 @igt(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp sgt i32 %x, %y
  %tobool3 = icmp eq i32 %ok, 0
  br i1 %0, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool3, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool3, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.then, %if.else
  ret i32 0
}

define i32 @ige(i32 %x, i32 %y, i32 %ok) nounwind uwtable {
entry:
  %0 = icmp slt i32 %x, %y
  %tobool = icmp eq i32 %ok, 0
  br i1 %0, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end6

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.then, %if.else
  ret i32 0
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
