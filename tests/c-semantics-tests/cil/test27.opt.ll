; ModuleID = '/home/david/src/c-semantics/tests/cil/test27.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"fun\00", align 1
@s = global i8* getelementptr inbounds ([4 x i8]* @.str, i64 0, i64 0), align 8
@.str1 = private unnamed_addr constant [22 x i8] c"hello world %d %d %d\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %0 = load i8** @s, align 8, !tbaa !0
  %1 = load i8* %0, align 1, !tbaa !1
  %conv = sext i8 %1 to i32
  %arrayidx1 = getelementptr inbounds i8* %0, i64 1
  %2 = load i8* %arrayidx1, align 1, !tbaa !1
  %conv2 = sext i8 %2 to i32
  %arrayidx3 = getelementptr inbounds i8* %0, i64 3
  %3 = load i8* %arrayidx3, align 1, !tbaa !1
  %conv4 = sext i8 %3 to i32
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([22 x i8]* @.str1, i64 0, i64 0), i32 %conv, i32 %conv2, i32 %conv4) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
