; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr34415.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [5 x i8] c"Bbb:\00", align 1

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

define i8* @foo(i8* %p) nounwind uwtable readonly noinline {
entry:
  br label %for.cond

for.cond:                                         ; preds = %if.end25, %entry
  %indvar10 = phi i32 [ %phitmp, %if.end25 ], [ 1, %entry ]
  %tmp395 = phi i8* [ %tmp412, %if.end25 ], [ undef, %entry ]
  %tmp412 = phi i8* [ %incdec.ptr27, %if.end25 ], [ %p, %entry ]
  %tmp1 = load i8* %tmp412, align 1
  %conv = sext i8 %tmp1 to i32
  %cmp = icmp sgt i8 %tmp1, 96
  br i1 %cmp, label %land.lhs.true, label %cond.end

land.lhs.true:                                    ; preds = %for.cond
  %cmp5 = icmp slt i8 %tmp1, 123
  br i1 %cmp5, label %cond.true, label %for.end

cond.true:                                        ; preds = %land.lhs.true
  %add = add i32 %conv, -32
  br label %cond.end

cond.end:                                         ; preds = %for.cond, %cond.true
  %cond = phi i32 [ %add, %cond.true ], [ %conv, %for.cond ]
  switch i32 %cond, label %for.end [
    i32 66, label %if.end25
    i32 65, label %do.body
  ]

do.body:                                          ; preds = %cond.end, %do.body
  %indvar = phi i64 [ %tmp, %do.body ], [ 0, %cond.end ]
  %tmp = add i64 %indvar, 1
  %incdec.ptr = getelementptr i8* %tmp412, i64 %tmp
  %tmp20 = load i8* %incdec.ptr, align 1
  %cmp22 = icmp eq i8 %tmp20, 43
  br i1 %cmp22, label %do.body, label %if.end25

if.end25:                                         ; preds = %do.body, %cond.end
  %tmp413 = phi i8* [ %tmp412, %cond.end ], [ %incdec.ptr, %do.body ]
  %incdec.ptr27 = getelementptr inbounds i8* %tmp413, i64 1
  %phitmp = add i32 %indvar10, 1
  br label %for.cond

for.end:                                          ; preds = %cond.end, %land.lhs.true
  %cmp30 = icmp sgt i32 %indvar10, 2
  %cmp36 = icmp eq i8 %tmp1, 58
  %or.cond = and i1 %cmp30, %cmp36
  %tmp411 = select i1 %or.cond, i8* %tmp395, i8* %tmp412
  ret i8* %tmp411
}

define i32 @main() nounwind uwtable readonly {
entry:
  %call = tail call i8* @foo(i8* getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 0))
  %cmp = icmp ne i8* %call, getelementptr inbounds ([5 x i8]* @.str, i64 0, i64 2)
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}
