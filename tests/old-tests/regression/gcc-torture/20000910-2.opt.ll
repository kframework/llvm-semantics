; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000910-2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"*\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@list = global [2 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0)], align 16

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
  br label %for.cond.i

for.cond.i:                                       ; preds = %for.inc.i, %entry
  %indvar.i = phi i64 [ %indvar.next.i, %for.inc.i ], [ 0, %entry ]
  %storemerge.i = trunc i64 %indvar.i to i32
  %cmp.i = icmp ult i32 %storemerge.i, 2
  br i1 %cmp.i, label %for.body.i, label %foo.exit

for.body.i:                                       ; preds = %for.cond.i
  %arrayidx.i = getelementptr [2 x i8*]* @list, i64 0, i64 %indvar.i
  %tmp4.i = load i8** %arrayidx.i, align 8
  %call.i.i = tail call i8* @strchr(i8* %tmp4.i, i32 42) nounwind readonly
  %cmp.i.i = icmp eq i8* %call.i.i, null
  br i1 %cmp.i.i, label %if.end.i, label %for.inc.i

if.end.i:                                         ; preds = %for.body.i
  %cmp7.i = icmp eq i32 %storemerge.i, 0
  br i1 %cmp7.i, label %if.then9.i, label %if.else.i

if.then9.i:                                       ; preds = %if.end.i
  tail call void @abort() noreturn nounwind
  unreachable

if.else.i:                                        ; preds = %if.end.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable

for.inc.i:                                        ; preds = %for.body.i
  %indvar.next.i = add i64 %indvar.i, 1
  br label %for.cond.i

foo.exit:                                         ; preds = %for.cond.i
  ret i32 0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

declare i8* @strchr(i8*, i32) nounwind readonly
