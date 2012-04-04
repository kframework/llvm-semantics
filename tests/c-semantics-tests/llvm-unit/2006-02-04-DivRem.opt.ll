; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2006-02-04-DivRem.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"%u %u %u %u\0A\00", align 1
@i = common global i32 0, align 4

define void @test(i32 %X, i32 %Y) nounwind uwtable {
entry:
  %and = and i32 %Y, 15
  %shl = shl nuw i32 8, %and
  %0 = add i32 %and, 3
  %div = lshr i32 %X, %0
  %1 = add i32 %shl, -1
  %rem = and i32 %1, %X
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %X, i32 %Y, i32 %div, i32 %rem) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  store i32 10, i32* @i, align 4
  br label %for.body

for.body:                                         ; preds = %entry, %for.body
  %storemerge1 = phi i32 [ 10, %entry ], [ %mul, %for.body ]
  %xor = xor i32 %storemerge1, 12345
  %and.i = and i32 %xor, 15
  %shl.i = shl nuw i32 8, %and.i
  %0 = add i32 %and.i, 3
  %div.i = lshr i32 %storemerge1, %0
  %1 = add i32 %shl.i, -1
  %rem.i = and i32 %1, %storemerge1
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str, i64 0, i64 0), i32 %storemerge1, i32 %xor, i32 %div.i, i32 %rem.i) nounwind
  %2 = load i32* @i, align 4, !tbaa !0
  %3 = mul i32 %2, -3
  %mul = add i32 %3, -3
  store i32 %mul, i32* @i, align 4
  %cmp = icmp slt i32 %mul, 139045193
  br i1 %cmp, label %for.body, label %for.end

for.end:                                          ; preds = %for.body
  ret i32 0
}

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
