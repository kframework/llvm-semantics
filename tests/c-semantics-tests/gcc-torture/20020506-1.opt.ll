; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020506-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define void @test1(i8 signext %c, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i8 %c, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end45

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end45, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %if.else, %if.then
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i8 zeroext %c, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i8 %c, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end45

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end45, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test3(i16 signext %s, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i16 %s, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end45

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end45, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test4(i16 zeroext %s, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i16 %s, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then2, label %if.end45

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end45, label %if.then4

if.then4:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end45:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test5(i32 %i, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %i, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then1, label %if.end38

if.then1:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end38, label %if.then3

if.then3:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test6(i32 %i, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %i, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then1, label %if.end38

if.then1:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end38, label %if.then3

if.then3:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test7(i64 %l, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i64 %l, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then1, label %if.end38

if.then1:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end38, label %if.then3

if.then3:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.else, %if.then
  ret void
}

define void @test8(i64 %l, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i64 %l, -1
  %tobool = icmp ne i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.then1, label %if.end38

if.then1:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.end38, label %if.then3

if.then3:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end38:                                         ; preds = %if.else, %if.then
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
