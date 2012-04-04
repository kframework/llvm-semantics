; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20080424-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@bar.i = internal unnamed_addr global i32 0, align 4
@g = common global [48 x [3 x [3 x i32]]] zeroinitializer, align 16

define void @bar([3 x i32]* %x, [3 x i32]* %y) nounwind uwtable noinline {
entry:
  %0 = load i32* @bar.i, align 4, !tbaa !0
  %add = add nsw i32 %0, 8
  %idxprom = sext i32 %add to i64
  %arraydecay = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i64 0, i64 %idxprom, i64 0
  %cmp = icmp eq [3 x i32]* %arraydecay, %x
  br i1 %cmp, label %lor.lhs.false, label %if.then

lor.lhs.false:                                    ; preds = %entry
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* @bar.i, align 4, !tbaa !0
  %idxprom1 = sext i32 %0 to i64
  %arraydecay3 = getelementptr inbounds [48 x [3 x [3 x i32]]]* @g, i64 0, i64 %idxprom1, i64 0
  %cmp4 = icmp eq [3 x i32]* %arraydecay3, %y
  br i1 %cmp4, label %if.end, label %if.then

if.then:                                          ; preds = %lor.lhs.false, %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 8, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 0, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 9, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 1, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 10, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 2, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 11, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 3, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 12, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 4, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 13, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 5, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 14, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 6, i64 0)) nounwind
  tail call void @bar([3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 15, i64 0), [3 x i32]* getelementptr inbounds ([48 x [3 x [3 x i32]]]* @g, i64 0, i64 7, i64 0)) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
