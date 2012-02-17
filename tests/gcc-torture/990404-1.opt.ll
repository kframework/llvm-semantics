; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990404-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@x = global [10 x i32] [i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i32 9], align 16

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

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end16, %entry
  %tmp172 = phi i32 [ %tmp174.9, %if.end16 ], [ undef, %entry ]
  %inc211 = phi i32 [ %inc21, %if.end16 ], [ 0, %entry ]
  %inc21 = add i32 %inc211, 1
  %tmp4 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 0), align 16
  %cmp6 = icmp sgt i32 %tmp4, 0
  %tmp135 = select i1 %cmp6, i32 %tmp4, i32 0
  %tmp174 = select i1 %cmp6, i32 0, i32 %tmp172
  %tmp4.1 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 1), align 4
  %cmp6.1 = icmp sgt i32 %tmp4.1, %tmp135
  %tmp135.1 = select i1 %cmp6.1, i32 %tmp4.1, i32 %tmp135
  %tmp174.1 = select i1 %cmp6.1, i32 1, i32 %tmp174
  %tmp4.2 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 2), align 8
  %cmp6.2 = icmp sgt i32 %tmp4.2, %tmp135.1
  %tmp135.2 = select i1 %cmp6.2, i32 %tmp4.2, i32 %tmp135.1
  %tmp174.2 = select i1 %cmp6.2, i32 2, i32 %tmp174.1
  %tmp4.3 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 3), align 4
  %cmp6.3 = icmp sgt i32 %tmp4.3, %tmp135.2
  %tmp135.3 = select i1 %cmp6.3, i32 %tmp4.3, i32 %tmp135.2
  %tmp174.3 = select i1 %cmp6.3, i32 3, i32 %tmp174.2
  %tmp4.4 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 4), align 16
  %cmp6.4 = icmp sgt i32 %tmp4.4, %tmp135.3
  %tmp135.4 = select i1 %cmp6.4, i32 %tmp4.4, i32 %tmp135.3
  %tmp174.4 = select i1 %cmp6.4, i32 4, i32 %tmp174.3
  %tmp4.5 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 5), align 4
  %cmp6.5 = icmp sgt i32 %tmp4.5, %tmp135.4
  %tmp135.5 = select i1 %cmp6.5, i32 %tmp4.5, i32 %tmp135.4
  %tmp174.5 = select i1 %cmp6.5, i32 5, i32 %tmp174.4
  %tmp4.6 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 6), align 8
  %cmp6.6 = icmp sgt i32 %tmp4.6, %tmp135.5
  %tmp135.6 = select i1 %cmp6.6, i32 %tmp4.6, i32 %tmp135.5
  %tmp174.6 = select i1 %cmp6.6, i32 6, i32 %tmp174.5
  %tmp4.7 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 7), align 4
  %cmp6.7 = icmp sgt i32 %tmp4.7, %tmp135.6
  %tmp135.7 = select i1 %cmp6.7, i32 %tmp4.7, i32 %tmp135.6
  %tmp174.7 = select i1 %cmp6.7, i32 7, i32 %tmp174.6
  %tmp4.8 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 8), align 16
  %cmp6.8 = icmp sgt i32 %tmp4.8, %tmp135.7
  %tmp135.8 = select i1 %cmp6.8, i32 %tmp4.8, i32 %tmp135.7
  %tmp174.8 = select i1 %cmp6.8, i32 8, i32 %tmp174.7
  %tmp4.9 = load i32* getelementptr inbounds ([10 x i32]* @x, i64 0, i64 9), align 4
  %cmp6.9 = icmp sgt i32 %tmp4.9, %tmp135.8
  %tmp135.9 = select i1 %cmp6.9, i32 %tmp4.9, i32 %tmp135.8
  %tmp174.9 = select i1 %cmp6.9, i32 9, i32 %tmp174.8
  %cmp14 = icmp eq i32 %tmp135.9, 0
  br i1 %cmp14, label %for.end26, label %if.end16

if.end16:                                         ; preds = %for.cond
  %idxprom18 = sext i32 %tmp174.9 to i64
  %arrayidx19 = getelementptr inbounds [10 x i32]* @x, i64 0, i64 %idxprom18
  store i32 0, i32* %arrayidx19, align 4
  %cmp23 = icmp sgt i32 %inc21, 10
  br i1 %cmp23, label %if.then24, label %for.cond

if.then24:                                        ; preds = %if.end16
  tail call void @abort() noreturn nounwind
  unreachable

for.end26:                                        ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
