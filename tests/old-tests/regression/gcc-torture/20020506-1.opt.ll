; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020506-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define void @test1(i8 signext %c, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i8 %c, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end56, label %if.then3

if.then3:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  %cmp12 = icmp slt i8 %c, 0
  br i1 %cmp12, label %if.end56, label %if.then22

if.then22:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end8, %if.then
  ret void
}

declare void @abort() noreturn nounwind

define void @test2(i8 zeroext %c, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i8 %c, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end56, label %if.then3

if.then3:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  %cmp12 = icmp slt i8 %c, 0
  br i1 %cmp12, label %if.end56, label %if.then22

if.then22:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end8, %if.then
  ret void
}

define void @test3(i16 signext %s, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i16 %s, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end56, label %if.then3

if.then3:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  %cmp12 = icmp slt i16 %s, 0
  br i1 %cmp12, label %if.end56, label %if.then22

if.then22:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end8, %if.then
  ret void
}

define void @test4(i16 zeroext %s, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i16 %s, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end56, label %if.then3

if.then3:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then6, label %if.end8

if.then6:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.else
  %cmp12 = icmp slt i16 %s, 0
  br i1 %cmp12, label %if.end56, label %if.then22

if.then22:                                        ; preds = %if.end8
  tail call void @abort() noreturn nounwind
  unreachable

if.end56:                                         ; preds = %if.end8, %if.then
  ret void
}

define void @test5(i32 %i, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %i, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end49, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  %cmp10 = icmp slt i32 %i, 0
  br i1 %cmp10, label %if.end49, label %if.then19

if.then19:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end7, %if.then
  ret void
}

define void @test6(i32 %i, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %i, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end49, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  %cmp10 = icmp slt i32 %i, 0
  br i1 %cmp10, label %if.end49, label %if.then19

if.then19:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end7, %if.then
  ret void
}

define void @test7(i64 %l, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i64 %l, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end49, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  %cmp10 = icmp slt i64 %l, 0
  br i1 %cmp10, label %if.end49, label %if.then19

if.then19:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end7, %if.then
  ret void
}

define void @test8(i64 %l, i32 %set) nounwind uwtable {
entry:
  %cmp = icmp sgt i64 %l, -1
  %tobool = icmp eq i32 %set, 0
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  br i1 %tobool, label %if.end49, label %if.then2

if.then2:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %entry
  br i1 %tobool, label %if.then5, label %if.end7

if.then5:                                         ; preds = %if.else
  tail call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.else
  %cmp10 = icmp slt i64 %l, 0
  br i1 %cmp10, label %if.end49, label %if.then19

if.then19:                                        ; preds = %if.end7
  tail call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end7, %if.then
  ret void
}

define i32 @main() nounwind uwtable readnone {
entry:
  ret i32 0
}
