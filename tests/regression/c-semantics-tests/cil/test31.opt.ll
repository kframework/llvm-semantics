; ModuleID = '/home/david/src/c-semantics/tests/cil/test31.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [18 x i8] c"hello world - %d\0A\00", align 1

define void @silly(i32* nocapture %w) nounwind uwtable {
entry:
  %arrayidx = getelementptr inbounds i32* %w, i64 1
  %0 = load i32* %arrayidx, align 4, !tbaa !0
  %inc = add nsw i32 %0, 1
  store i32 %inc, i32* %arrayidx, align 4, !tbaa !0
  ret void
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([18 x i8]* @.str, i64 0, i64 0), i32 6) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
