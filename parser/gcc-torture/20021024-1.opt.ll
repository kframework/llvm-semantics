; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20021024-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@cp = common global i64* null, align 8
@m = common global i64 0, align 8
@main.r = internal global [64 x i64] zeroinitializer, align 16

define void @foo() nounwind uwtable readnone {
entry:
  ret void
}

define void @bar(i32 %rop, i64* %r) nounwind uwtable {
entry:
  %shr = lshr i32 %rop, 23
  %shr2 = lshr i32 %rop, 9
  %and3 = and i32 %shr2, 511
  %and5 = and i32 %rop, 511
  %idxprom = zext i32 %and3 to i64
  %arrayidx = getelementptr inbounds i64* %r, i64 %idxprom
  %idxprom11 = zext i32 %shr to i64
  %arrayidx13 = getelementptr inbounds i64* %r, i64 %idxprom11
  %tobool = icmp eq i32 %and5, 0
  br i1 %tobool, label %top.us, label %if.end

top.us:                                           ; preds = %top.us, %entry
  %tmp6.us = load i64** @cp, align 8
  store i64 1, i64* %tmp6.us, align 8
  %tmp9.us = load i64* %arrayidx, align 8
  %tmp14.us = load i64* %arrayidx13, align 8
  %add.us = add i64 %tmp14.us, %tmp9.us
  store i64 %add.us, i64* @m, align 8
  %tmp15.us = load i64** @cp, align 8
  store i64 2, i64* %tmp15.us, align 8
  br label %top.us

if.end:                                           ; preds = %entry
  %tmp6 = load i64** @cp, align 8
  store i64 1, i64* %tmp6, align 8
  %tmp9 = load i64* %arrayidx, align 8
  %tmp14 = load i64* %arrayidx13, align 8
  %add = add i64 %tmp14, %tmp9
  store i64 %add, i64* @m, align 8
  %tmp15 = load i64** @cp, align 8
  store i64 2, i64* %tmp15, align 8
  %idxprom18 = zext i32 %and5 to i64
  %arrayidx20 = getelementptr inbounds i64* %r, i64 %idxprom18
  store i64 1, i64* %arrayidx20, align 8
  ret void
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  %cr = alloca i64, align 8
  store i64* %cr, i64** @cp, align 8
  store i64 47, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 4), align 16
  store i64 11, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 8), align 16
  store i64 58, i64* @m, align 8
  store i64 2, i64* %cr, align 8
  store i64 1, i64* getelementptr inbounds ([64 x i64]* @main.r, i64 0, i64 15), align 8
  call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
