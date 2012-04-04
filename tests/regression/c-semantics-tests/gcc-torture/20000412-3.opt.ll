; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i8, [32 x i8] }

define i32 @z() nounwind uwtable readnone {
f.exit:
  ret i32 96
}

define i32 @main() noreturn nounwind uwtable {
if.end:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind

define i32 @f(%struct.X* nocapture byval align 8 %x, %struct.X* nocapture byval align 8 %y) nounwind uwtable readonly {
entry:
  %0 = bitcast %struct.X* %x to i16*
  %1 = load i16* %0, align 8
  %2 = trunc i16 %1 to i8
  %3 = bitcast %struct.X* %y to i16*
  %4 = load i16* %3, align 8
  %5 = trunc i16 %4 to i8
  %cmp = icmp eq i8 %2, %5
  br i1 %cmp, label %if.end, label %return

if.end:                                           ; preds = %entry
  %6 = lshr i16 %4, 8
  %7 = lshr i16 %1, 8
  %8 = zext i16 %6 to i32
  %9 = zext i16 %7 to i32
  %sext = shl nuw i32 %9, 24
  %conv6 = ashr exact i32 %sext, 24
  %sext10 = shl nuw i32 %8, 24
  %conv9 = ashr exact i32 %sext10, 24
  %add = add nsw i32 %conv9, %conv6
  br label %return

return:                                           ; preds = %entry, %if.end
  %retval.0 = phi i32 [ %add, %if.end ], [ 70, %entry ]
  ret i32 %retval.0
}
