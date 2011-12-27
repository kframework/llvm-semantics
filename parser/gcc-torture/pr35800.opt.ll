; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr35800.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"int\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"short\00", align 1
@.str33 = private unnamed_addr constant [10 x i8] c"integer*8\00", align 1

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

define i32 @stab_xcoff_builtin_type(i32 %typenum) nounwind uwtable readonly {
entry:
  %0 = icmp ult i32 %typenum, -34
  br i1 %0, label %return, label %if.end

if.end:                                           ; preds = %entry
  %sub = sub nsw i32 0, %typenum
  switch i32 %sub, label %sw.epilog [
    i32 1, label %sw.bb
    i32 2, label %sw.bb5
    i32 3, label %sw.bb5
    i32 4, label %sw.bb36
    i32 5, label %sw.bb36
    i32 6, label %sw.bb36
    i32 7, label %sw.bb36
    i32 8, label %sw.bb36
    i32 9, label %sw.bb36
    i32 10, label %sw.bb36
    i32 11, label %sw.bb36
    i32 12, label %sw.bb36
    i32 13, label %sw.bb36
    i32 14, label %sw.bb36
    i32 15, label %sw.bb36
    i32 16, label %sw.bb36
    i32 17, label %sw.bb36
    i32 18, label %sw.bb36
    i32 19, label %sw.bb36
    i32 20, label %sw.bb36
    i32 21, label %sw.bb36
    i32 22, label %sw.bb36
    i32 23, label %sw.bb36
    i32 24, label %sw.bb36
    i32 25, label %sw.bb36
    i32 26, label %sw.bb36
    i32 27, label %sw.bb36
    i32 28, label %sw.bb36
    i32 29, label %sw.bb36
    i32 30, label %sw.bb36
    i32 31, label %sw.bb36
    i32 32, label %sw.bb36
    i32 33, label %sw.bb36
    i32 34, label %sw.bb36
  ]

sw.bb:                                            ; preds = %if.end
  br label %sw.epilog

sw.bb5:                                           ; preds = %if.end, %if.end
  br label %sw.epilog

sw.bb36:                                          ; preds = %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end, %if.end
  br label %sw.epilog

sw.epilog:                                        ; preds = %sw.bb36, %sw.bb5, %sw.bb, %if.end
  %tmp371 = phi i8* [ getelementptr inbounds ([10 x i8]* @.str33, i64 0, i64 0), %sw.bb36 ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %sw.bb5 ], [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %sw.bb ], [ undef, %if.end ]
  %tmp38 = load i8* %tmp371, align 1
  %conv = sext i8 %tmp38 to i32
  br label %return

return:                                           ; preds = %entry, %sw.epilog
  %storemerge = phi i32 [ %conv, %sw.epilog ], [ 0, %entry ]
  ret i32 %storemerge
}

define i32 @main() nounwind uwtable {
stab_xcoff_builtin_type.exit12:
  br label %for.cond

for.cond:                                         ; preds = %stab_xcoff_builtin_type.exit12, %for.inc
  %indvar = phi i32 [ 0, %stab_xcoff_builtin_type.exit12 ], [ %indvar.next, %for.inc ]
  %storemerge = sub i32 -4, %indvar
  %cmp13 = icmp sgt i32 %storemerge, -35
  br i1 %cmp13, label %for.body, label %if.end23

for.body:                                         ; preds = %for.cond
  %0 = icmp ult i32 %storemerge, -34
  br i1 %0, label %if.then17, label %if.end.i

if.end.i:                                         ; preds = %for.body
  switch i32 %indvar, label %stab_xcoff_builtin_type.exit4 [
    i32 -3, label %sw.bb.i
    i32 -2, label %sw.bb5.i
    i32 -1, label %sw.bb5.i
    i32 0, label %sw.bb36.i
    i32 1, label %sw.bb36.i
    i32 2, label %sw.bb36.i
    i32 3, label %sw.bb36.i
    i32 4, label %sw.bb36.i
    i32 5, label %sw.bb36.i
    i32 6, label %sw.bb36.i
    i32 7, label %sw.bb36.i
    i32 8, label %sw.bb36.i
    i32 9, label %sw.bb36.i
    i32 10, label %sw.bb36.i
    i32 11, label %sw.bb36.i
    i32 12, label %sw.bb36.i
    i32 13, label %sw.bb36.i
    i32 14, label %sw.bb36.i
    i32 15, label %sw.bb36.i
    i32 16, label %sw.bb36.i
    i32 17, label %sw.bb36.i
    i32 18, label %sw.bb36.i
    i32 19, label %sw.bb36.i
    i32 20, label %sw.bb36.i
    i32 21, label %sw.bb36.i
    i32 22, label %sw.bb36.i
    i32 23, label %sw.bb36.i
    i32 24, label %sw.bb36.i
    i32 25, label %sw.bb36.i
    i32 26, label %sw.bb36.i
    i32 27, label %sw.bb36.i
    i32 28, label %sw.bb36.i
    i32 29, label %sw.bb36.i
    i32 30, label %sw.bb36.i
  ]

sw.bb.i:                                          ; preds = %if.end.i
  br label %stab_xcoff_builtin_type.exit4

sw.bb5.i:                                         ; preds = %if.end.i, %if.end.i
  br label %stab_xcoff_builtin_type.exit4

sw.bb36.i:                                        ; preds = %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i, %if.end.i
  br label %stab_xcoff_builtin_type.exit4

stab_xcoff_builtin_type.exit4:                    ; preds = %if.end.i, %sw.bb.i, %sw.bb5.i, %sw.bb36.i
  %tmp371.i = phi i8* [ getelementptr inbounds ([10 x i8]* @.str33, i64 0, i64 0), %sw.bb36.i ], [ getelementptr inbounds ([6 x i8]* @.str2, i64 0, i64 0), %sw.bb5.i ], [ getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), %sw.bb.i ], [ undef, %if.end.i ]
  %tmp38.i = load i8* %tmp371.i, align 1
  %cmp16 = icmp eq i8 %tmp38.i, 105
  br i1 %cmp16, label %for.inc, label %if.then17

if.then17:                                        ; preds = %for.body, %stab_xcoff_builtin_type.exit4
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %stab_xcoff_builtin_type.exit4
  %indvar.next = add i32 %indvar, 1
  br label %for.cond

if.end23:                                         ; preds = %for.cond
  ret i32 0
}

declare void @abort() noreturn nounwind
