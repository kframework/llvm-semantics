; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/990222-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@line = global [4 x i8] c"199\00", align 1

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
  %tmp14 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1
  %add5 = add i8 %tmp14, 1
  store i8 %add5, i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1
  %cmp6 = icmp sgt i8 %add5, 57
  br i1 %cmp6, label %while.body, label %while.end

while.body:                                       ; preds = %entry, %while.body
  %indvar = phi i64 [ %indvar.next, %while.body ], [ 0, %entry ]
  %tmp8 = sub i64 1, %indvar
  %incdec.ptr = getelementptr [4 x i8]* @line, i64 0, i64 %tmp8
  %tmp9 = sub i64 2, %indvar
  %incdec.ptr7 = getelementptr [4 x i8]* @line, i64 0, i64 %tmp9
  store i8 48, i8* %incdec.ptr7, align 1
  %tmp1 = load i8* %incdec.ptr, align 1
  %add = add i8 %tmp1, 1
  store i8 %add, i8* %incdec.ptr, align 1
  %cmp = icmp sgt i8 %add, 57
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %while.body, label %while.cond.while.end_crit_edge

while.cond.while.end_crit_edge:                   ; preds = %while.body
  %tmp15.pre = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 2), align 1
  br label %while.end

while.end:                                        ; preds = %while.cond.while.end_crit_edge, %entry
  %tmp15 = phi i8 [ %tmp15.pre, %while.cond.while.end_crit_edge ], [ %add5, %entry ]
  %tmp6 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 0), align 1
  %cmp8 = icmp eq i8 %tmp6, 50
  %tmp10 = load i8* getelementptr inbounds ([4 x i8]* @line, i64 0, i64 1), align 1
  %cmp12 = icmp eq i8 %tmp10, 48
  %or.cond = and i1 %cmp8, %cmp12
  %cmp17 = icmp eq i8 %tmp15, 48
  %or.cond2 = and i1 %or.cond, %cmp17
  br i1 %or.cond2, label %if.end, label %if.then

if.then:                                          ; preds = %while.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  ret i32 0
}

declare void @abort() noreturn nounwind
