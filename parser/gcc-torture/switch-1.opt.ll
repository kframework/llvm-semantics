; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/switch-1.ll'
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

define i32 @foo(i32 %x) nounwind uwtable readnone {
entry:
  switch i32 %x, label %sw.epilog [
    i32 4, label %return
    i32 6, label %return
    i32 9, label %return
    i32 11, label %return
  ]

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %entry, %entry, %entry, %sw.epilog
  %storemerge = phi i32 [ 31, %sw.epilog ], [ 30, %entry ], [ 30, %entry ], [ 30, %entry ], [ 30, %entry ]
  ret i32 %storemerge
}

define i32 @main() nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %indvar = phi i32 [ %indvar.next, %for.inc ], [ 0, %entry ]
  %storemerge = add i32 %indvar, -1
  %cmp = icmp slt i32 %storemerge, 66
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  switch i32 %indvar, label %sw.epilog.i [
    i32 5, label %foo.exit
    i32 7, label %foo.exit
    i32 10, label %foo.exit
    i32 12, label %foo.exit
  ]

sw.epilog.i:                                      ; preds = %for.body
  br label %foo.exit

foo.exit:                                         ; preds = %for.body, %for.body, %for.body, %for.body, %sw.epilog.i
  %storemerge.i = phi i32 [ 31, %sw.epilog.i ], [ 30, %for.body ], [ 30, %for.body ], [ 30, %for.body ], [ 30, %for.body ]
  switch i32 %indvar, label %if.else30 [
    i32 5, label %if.then
    i32 7, label %if.then9
    i32 10, label %if.then17
    i32 12, label %if.then25
  ]

if.then:                                          ; preds = %foo.exit
  %cmp5 = icmp eq i32 %storemerge.i, 30
  br i1 %cmp5, label %for.inc, label %if.then6

if.then6:                                         ; preds = %if.then
  tail call void @abort() noreturn nounwind
  unreachable

if.then9:                                         ; preds = %foo.exit
  %cmp11 = icmp eq i32 %storemerge.i, 30
  br i1 %cmp11, label %for.inc, label %if.then12

if.then12:                                        ; preds = %if.then9
  tail call void @abort() noreturn nounwind
  unreachable

if.then17:                                        ; preds = %foo.exit
  %cmp19 = icmp eq i32 %storemerge.i, 30
  br i1 %cmp19, label %for.inc, label %if.then20

if.then20:                                        ; preds = %if.then17
  tail call void @abort() noreturn nounwind
  unreachable

if.then25:                                        ; preds = %foo.exit
  %cmp27 = icmp eq i32 %storemerge.i, 30
  br i1 %cmp27, label %for.inc, label %if.then28

if.then28:                                        ; preds = %if.then25
  tail call void @abort() noreturn nounwind
  unreachable

if.else30:                                        ; preds = %foo.exit
  %cmp32 = icmp eq i32 %storemerge.i, 31
  br i1 %cmp32, label %for.inc, label %if.then33

if.then33:                                        ; preds = %if.else30
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.then, %if.then17, %if.else30, %if.then25, %if.then9
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
