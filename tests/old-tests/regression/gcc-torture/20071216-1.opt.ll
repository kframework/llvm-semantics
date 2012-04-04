; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20071216-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = internal unnamed_addr global i32 0, align 4

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

define i32 @bar() nounwind uwtable readonly noinline {
entry:
  %tmp = load i32* @x, align 4
  ret i32 %tmp
}

define i32 @foo() nounwind uwtable readonly {
entry:
  %call = tail call i32 @bar()
  %cmp = icmp ult i32 %call, -4095
  br i1 %cmp, label %return, label %if.end

if.end:                                           ; preds = %entry
  %conv = sext i32 %call to i64
  %sub = sub nsw i64 0, %conv
  %cmp5 = icmp eq i64 %sub, 38
  %conv.op = add i32 %call, 1
  %add = select i1 %cmp5, i32 %conv.op, i32 -1
  br label %return

return:                                           ; preds = %entry, %if.end
  %storemerge.in = phi i32 [ %add, %if.end ], [ %call, %entry ]
  ret i32 %storemerge.in
}

define i32 @main() nounwind uwtable {
entry:
  store i32 26, i32* @x, align 4
  %call.i = tail call i32 @bar() nounwind
  %cmp.i = icmp ult i32 %call.i, -4095
  br i1 %cmp.i, label %foo.exit, label %if.end.i

if.end.i:                                         ; preds = %entry
  %conv.i = sext i32 %call.i to i64
  %sub.i = sub nsw i64 0, %conv.i
  %cmp5.i = icmp eq i64 %sub.i, 38
  %conv.op.i = add i32 %call.i, 1
  %add.i = select i1 %cmp5.i, i32 %conv.op.i, i32 -1
  br label %foo.exit

foo.exit:                                         ; preds = %entry, %if.end.i
  %storemerge.in.i = phi i32 [ %add.i, %if.end.i ], [ %call.i, %entry ]
  %cmp = icmp eq i32 %storemerge.in.i, 26
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit
  store i32 -39, i32* @x, align 4
  %call.i1 = tail call i32 @bar() nounwind
  %cmp.i2 = icmp ult i32 %call.i1, -4095
  br i1 %cmp.i2, label %if.then3, label %foo.exit10

foo.exit10:                                       ; preds = %if.end
  %conv.i3 = sext i32 %call.i1 to i64
  %sub.i4 = sub nsw i64 0, %conv.i3
  %cmp223 = icmp eq i32 %call.i1, -2
  %not.cmp5.i5 = icmp ne i64 %sub.i4, 38
  %cmp2 = or i1 %cmp223, %not.cmp5.i5
  br i1 %cmp2, label %if.end4, label %if.then3

if.then3:                                         ; preds = %if.end, %foo.exit10
  tail call void @abort() noreturn nounwind
  unreachable

if.end4:                                          ; preds = %foo.exit10
  store i32 -38, i32* @x, align 4
  %call.i11 = tail call i32 @bar() nounwind
  %cmp.i12 = icmp ult i32 %call.i11, -4095
  br i1 %cmp.i12, label %if.then7, label %foo.exit20

foo.exit20:                                       ; preds = %if.end4
  %conv.i13 = sext i32 %call.i11 to i64
  %sub.i14 = sub nsw i64 0, %conv.i13
  %cmp5.i15 = icmp eq i64 %sub.i14, 38
  %cmp624 = icmp eq i32 %call.i11, -38
  %cmp6 = and i1 %cmp5.i15, %cmp624
  br i1 %cmp6, label %if.end8, label %if.then7

if.then7:                                         ; preds = %if.end4, %foo.exit20
  tail call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %foo.exit20
  ret i32 0
}

declare void @abort() noreturn nounwind
