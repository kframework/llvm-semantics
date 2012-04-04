; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-1.ll'
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

define i32 @main() noreturn nounwind uwtable {
entry:
  %k = alloca [3 x i32], align 4
  %arrayidx = getelementptr [3 x i32]* %k, i64 0, i64 0
  store i32 0, i32* %arrayidx, align 4
  %arrayidx.1 = getelementptr [3 x i32]* %k, i64 0, i64 1
  store i32 1, i32* %arrayidx.1, align 4
  %arrayidx.2 = getelementptr [3 x i32]* %k, i64 0, i64 2
  store i32 2, i32* %arrayidx.2, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %entry, %for.inc15
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.inc15 ]
  %tmp5 = sub i64 2, %indvar
  %storemerge1 = trunc i64 %tmp5 to i32
  %cmp7 = icmp sgt i32 %storemerge1, -1
  br i1 %cmp7, label %for.body8, label %for.end17

for.body8:                                        ; preds = %for.cond5
  %arrayidx11 = getelementptr [3 x i32]* %k, i64 0, i64 %tmp5
  %tmp12 = load i32* %arrayidx11, align 4
  %cmp14 = icmp eq i32 %tmp12, %storemerge1
  br i1 %cmp14, label %for.inc15, label %if.then

if.then:                                          ; preds = %for.body8
  call void @abort() noreturn nounwind
  unreachable

for.inc15:                                        ; preds = %for.body8
  %indvar.next = add i64 %indvar, 1
  br label %for.cond5

for.end17:                                        ; preds = %for.cond5
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
