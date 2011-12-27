; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000412-6.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@buf = global [5 x i16] [i16 1, i16 4, i16 16, i16 64, i16 256], align 2

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
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvar.i = phi i64 [ %tmp, %for.body.i ], [ 0, %entry ]
  %tmp1013.i = phi i16 [ %sub.i, %for.body.i ], [ 512, %entry ]
  %tmp = add i64 %indvar.i, 1
  %incdec.ptr.i = getelementptr [5 x i16]* @buf, i64 0, i64 %tmp
  %storemerge4.i = getelementptr [5 x i16]* @buf, i64 0, i64 %indvar.i
  %tmp5.i = load i16* %storemerge4.i, align 2
  %sub.i = sub i16 %tmp1013.i, %tmp5.i
  %cmp.i = icmp ult i16* %incdec.ptr.i, getelementptr inbounds ([5 x i16]* @buf, i64 0, i64 3)
  br i1 %cmp.i, label %for.body.i, label %bug.exit

bug.exit:                                         ; preds = %for.body.i
  %cmp = icmp eq i16 %sub.i, 491
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %bug.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %bug.exit
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

define i32 @bug(i16 zeroext %value, i16* %buffer, i16* %bufend) nounwind uwtable readonly {
entry:
  %cmp2 = icmp ult i16* %buffer, %bufend
  br i1 %cmp2, label %for.body, label %for.end

for.body:                                         ; preds = %entry, %for.body
  %indvar = phi i64 [ %tmp, %for.body ], [ 0, %entry ]
  %tmp1013 = phi i16 [ %sub, %for.body ], [ %value, %entry ]
  %tmp = add i64 %indvar, 1
  %incdec.ptr = getelementptr i16* %buffer, i64 %tmp
  %storemerge4 = getelementptr i16* %buffer, i64 %indvar
  %tmp5 = load i16* %storemerge4, align 2
  %sub = sub i16 %tmp1013, %tmp5
  %cmp = icmp ult i16* %incdec.ptr, %bufend
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body, %entry
  %tmp101.lcssa = phi i16 [ %value, %entry ], [ %sub, %for.body ]
  %conv11 = zext i16 %tmp101.lcssa to i32
  ret i32 %conv11
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
