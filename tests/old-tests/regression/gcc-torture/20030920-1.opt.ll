; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20030920-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [3 x i8] c"\7F\FF\00", align 1

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
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %indvar = phi i64 [ 0, %entry ], [ %tmp6, %for.body ]
  %tmp25 = phi i8 [ 127, %entry ], [ %tmp2, %for.body ]
  %tmp823 = phi i32 [ 0, %entry ], [ %tmp82.inc, %for.body ]
  %tmp6 = add i64 %indvar, 1
  %incdec.ptr = getelementptr [3 x i8]* @.str, i64 0, i64 %tmp6
  %tmp2.lobit = lshr i8 %tmp25, 7
  %tmp = zext i8 %tmp2.lobit to i32
  %tmp82.inc = add nsw i32 %tmp, %tmp823
  %tmp2 = load i8* %incdec.ptr, align 1
  %tobool = icmp eq i64 %tmp6, 2
  br i1 %tobool, label %for.end, label %for.body

for.end:                                          ; preds = %for.body
  %cmp9 = icmp eq i32 %tmp82.inc, 1
  br i1 %cmp9, label %if.end12, label %if.then11

if.then11:                                        ; preds = %for.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %for.end
  ret i32 0
}

declare void @abort() noreturn nounwind
