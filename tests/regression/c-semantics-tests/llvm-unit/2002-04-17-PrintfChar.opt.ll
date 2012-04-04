; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-04-17-PrintfChar.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"'%c' '%c'\0A\00", align 1

define void @printArgsNoRet(i8 signext %a3, i8* nocapture %a5) nounwind uwtable {
entry:
  %conv = sext i8 %a3 to i32
  %0 = load i8* %a5, align 1, !tbaa !0
  %conv1 = sext i8 %0 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 %conv, i32 %conv1) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main() nounwind uwtable {
entry:
  %call.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 99, i32 101) nounwind
  ret i32 0
}

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
