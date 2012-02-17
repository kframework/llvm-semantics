; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20060905-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@s = common global [256 x [3 x i8]] zeroinitializer, align 16
@g = common global i8 0, align 1

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

define i32 @main() nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.inc.i, %entry
  %indvar.i = phi i64 [ 0, %entry ], [ %1, %for.inc.i ]
  %tmp1123.i = phi i32 [ 0, %entry ], [ %tmp111.i, %for.inc.i ]
  %tmp = add i64 %indvar.i, -128
  %storemerge.off.i = trunc i64 %tmp to i32
  %0 = icmp ult i32 %storemerge.off.i, 128
  br i1 %0, label %if.then.i, label %for.inc.i

if.then.i:                                        ; preds = %for.body.i
  %arrayidx6.i = getelementptr [256 x [3 x i8]]* @s, i64 0, i64 %tmp, i64 0
  %tmp7.i = volatile load i8* %arrayidx6.i, align 1
  store i8 %tmp7.i, i8* @g, align 1
  %inc.i = add nsw i32 %tmp1123.i, 1
  br label %for.inc.i

for.inc.i:                                        ; preds = %if.then.i, %for.body.i
  %tmp111.i = phi i32 [ %tmp1123.i, %for.body.i ], [ %inc.i, %if.then.i ]
  %1 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %1, 256
  br i1 %exitcond, label %foo.exit, label %for.body.i

foo.exit:                                         ; preds = %for.inc.i
  %cmp = icmp eq i32 %tmp111.i, 128
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %foo.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %foo.exit
  ret i32 0
}

declare void @abort() noreturn nounwind
