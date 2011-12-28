; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040218-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.y = internal unnamed_addr constant [2 x i64] [i64 -1, i64 16000], align 16

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

define i64 @xb(i64* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %tmp1 = load i64* %y, align 8
  %and = and i64 %tmp1, 255
  %arrayidx = getelementptr inbounds i64* %y, i64 1
  %tmp4 = load i64* %arrayidx, align 8
  %add = add nsw i64 %and, %tmp4
  ret i64 %add
}

define i64 @xw(i64* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %tmp1 = load i64* %y, align 8
  %and = and i64 %tmp1, 65535
  %arrayidx = getelementptr inbounds i64* %y, i64 1
  %tmp4 = load i64* %arrayidx, align 8
  %add = add nsw i64 %and, %tmp4
  ret i64 %add
}

define signext i16 @yb(i16* nocapture %y) nounwind uwtable readonly noinline {
entry:
  %tmp1 = load i16* %y, align 2
  %and = and i16 %tmp1, 255
  %arrayidx = getelementptr inbounds i16* %y, i64 1
  %tmp6 = load i16* %arrayidx, align 2
  %add = add i16 %and, %tmp6
  ret i16 %add
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %yw = alloca i32, align 4
  store i32 1048641535, i32* %yw, align 4
  %call = call i64 @xb(i64* getelementptr inbounds ([2 x i64]* @main.y, i64 0, i64 0))
  %cmp = icmp eq i64 %call, 16255
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %call4 = call i64 @xw(i64* getelementptr inbounds ([2 x i64]* @main.y, i64 0, i64 0))
  %cmp5 = icmp eq i64 %call4, 81535
  br i1 %cmp5, label %lor.lhs.false6, label %if.then

lor.lhs.false6:                                   ; preds = %lor.lhs.false
  %arraydecay7 = bitcast i32* %yw to i16*
  %call8 = call signext i16 @yb(i16* %arraydecay7)
  %cmp9 = icmp eq i16 %call8, 16255
  br i1 %cmp9, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false6, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false6
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
