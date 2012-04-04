; ModuleID = '/home/david/src/c-semantics/tests/llvm-regression/callargs.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str1 = private unnamed_addr constant [29 x i8] c"\09Args 1-5  : %d %d %c %d %c\0A\00", align 1
@.str2 = private unnamed_addr constant [29 x i8] c"\09Args 6-10 : %d %d %c %d %c\0A\00", align 1
@.str3 = private unnamed_addr constant [29 x i8] c"\09Args 11-14: %d %d %c %d %c\0A\00", align 1
@str = private unnamed_addr constant [35 x i8] c"\0AprintArgsNoRet with 15 arguments:\00"

define void @printArgsNoRet(i32 %a1, float %a2, i8 signext %a3, double %a4, i8* nocapture %a5, i32 %a6, float %a7, i8 signext %a8, double %a9, i8* nocapture %a10, i32 %a11, float %a12, i8 signext %a13, double %a14, i8* nocapture %a15) nounwind uwtable {
entry:
  %puts = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str, i64 0, i64 0))
  %conv = fptosi float %a2 to i32
  %conv1 = sext i8 %a3 to i32
  %conv2 = fptosi double %a4 to i32
  %0 = load i8* %a5, align 1, !tbaa !0
  %conv3 = sext i8 %0 to i32
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i32 %a1, i32 %conv, i32 %conv1, i32 %conv2, i32 %conv3) nounwind
  %conv5 = fptosi float %a7 to i32
  %conv6 = sext i8 %a8 to i32
  %conv7 = fptosi double %a9 to i32
  %1 = load i8* %a10, align 1, !tbaa !0
  %conv8 = sext i8 %1 to i32
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 %a6, i32 %conv5, i32 %conv6, i32 %conv7, i32 %conv8) nounwind
  %conv10 = fptosi float %a12 to i32
  %conv11 = sext i8 %a13 to i32
  %conv12 = fptosi double %a14 to i32
  %2 = load i8* %a15, align 1, !tbaa !0
  %conv13 = sext i8 %2 to i32
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i64 0, i64 0), i32 %a11, i32 %conv10, i32 %conv11, i32 %conv12, i32 %conv13) nounwind
  %putchar = tail call i32 @putchar(i32 10) nounwind
  ret void
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %puts.i = tail call i32 @puts(i8* getelementptr inbounds ([35 x i8]* @str, i64 0, i64 0)) nounwind
  %call4.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str1, i64 0, i64 0), i32 1, i32 2, i32 99, i32 4, i32 101) nounwind
  %call9.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str2, i64 0, i64 0), i32 6, i32 7, i32 104, i32 9, i32 106) nounwind
  %call14.i = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([29 x i8]* @.str3, i64 0, i64 0), i32 11, i32 12, i32 109, i32 14, i32 111) nounwind
  %putchar.i = tail call i32 @putchar(i32 10) nounwind
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

declare i32 @putchar(i32)

!0 = metadata !{metadata !"omnipotent char", metadata !1}
!1 = metadata !{metadata !"Simple C/C++ TBAA", null}
