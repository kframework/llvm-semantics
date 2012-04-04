; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2002-05-02-CastTest.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [23 x i8] c"ubc0 = '%c'\09   [0x%x]\0A\00", align 1
@.str1 = private unnamed_addr constant [21 x i8] c"ubs0 = %u\09   [0x%x]\0A\00", align 1
@.str2 = private unnamed_addr constant [21 x i8] c"ubs1 = %u\09   [0x%x]\0A\00", align 1
@.str3 = private unnamed_addr constant [21 x i8] c"bs0  = %d\09   [0x%x]\0A\00", align 1
@.str4 = private unnamed_addr constant [21 x i8] c"bs1  = %d\09   [0x%x]\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"c1   = '%c'\09   [0x%x]\0A\00", align 1
@.str6 = private unnamed_addr constant [21 x i8] c"s1   = %d\09   [0x%x]\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"uc2  = '%c'\09   [0x%x]\0A\00", align 1
@.str8 = private unnamed_addr constant [21 x i8] c"us2  = %u\09   [0x%x]\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"ic3  = '%c'\09   [0x%x]\0A\00", align 1
@.str10 = private unnamed_addr constant [21 x i8] c"is3  = %d\09   [0x%x]\0A\00", align 1
@.str11 = private unnamed_addr constant [21 x i8] c"is4  = %d\09   [0x%x]\0A\00", align 1
@.str12 = private unnamed_addr constant [21 x i8] c"is5  = %d\09   [0x%x]\0A\00", align 1
@.str13 = private unnamed_addr constant [23 x i8] c"uic4 = '%c'\09   [0x%x]\0A\00", align 1
@.str14 = private unnamed_addr constant [19 x i8] c"uis4 = %u  [0x%x]\0A\00", align 1

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %cmp = icmp sgt i32 %argc, 1
  br i1 %cmp, label %cond.end, label %cond.end7

cond.end:                                         ; preds = %entry
  %arrayidx = getelementptr inbounds i8** %argv, i64 1
  %0 = load i8** %arrayidx, align 8, !tbaa !0
  %call.i = tail call i64 @strtol(i8* nocapture %0, i8** null, i32 10) nounwind
  %phitmp = trunc i64 %call.i to i8
  %cmp1 = icmp sgt i32 %argc, 2
  br i1 %cmp1, label %cond.true3, label %cond.end7

cond.true3:                                       ; preds = %cond.end
  %arrayidx4 = getelementptr inbounds i8** %argv, i64 2
  %1 = load i8** %arrayidx4, align 8, !tbaa !0
  %call.i59 = tail call i64 @strtol(i8* nocapture %1, i8** null, i32 10) nounwind
  %phitmp57 = trunc i64 %call.i59 to i16
  br label %cond.end7

cond.end7:                                        ; preds = %entry, %cond.end, %cond.true3
  %cond62 = phi i8 [ %phitmp, %cond.true3 ], [ %phitmp, %cond.end ], [ 100, %entry ]
  %cond8 = phi i16 [ %phitmp57, %cond.true3 ], [ -769, %cond.end ], [ -769, %entry ]
  %conv10 = zext i16 %cond8 to i32
  %conv10.mask = and i16 %cond8, 255
  %conv11 = zext i16 %conv10.mask to i32
  %add = add nsw i32 %conv11, 1
  %conv16 = sext i8 %cond62 to i32
  %conv17 = sext i16 %cond8 to i32
  %sext = shl i32 %conv10, 24
  %conv20 = ashr exact i32 %sext, 24
  %add21 = add nsw i32 %conv20, 1
  %conv24 = zext i8 %cond62 to i32
  %call26 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str, i64 0, i64 0), i32 %conv24, i32 %conv24) nounwind
  %call29 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str1, i64 0, i64 0), i32 %conv11, i32 %conv11) nounwind
  %conv30 = and i32 %add, 255
  %call32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str2, i64 0, i64 0), i32 %conv30, i32 %conv30) nounwind
  %call35 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str3, i64 0, i64 0), i32 %conv20, i32 %conv20) nounwind
  %add14 = shl nuw i32 %conv11, 24
  %sext58 = add i32 %add14, 16777216
  %conv36 = ashr exact i32 %sext58, 24
  %call38 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str4, i64 0, i64 0), i32 %conv36, i32 %conv36) nounwind
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %conv16, i32 %conv16) nounwind
  %call44 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str6, i64 0, i64 0), i32 %conv17, i32 %conv17) nounwind
  %call47 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %conv24, i32 %conv24) nounwind
  %call50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str8, i64 0, i64 0), i32 %conv10, i32 %conv10) nounwind
  %call51 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 %conv16, i32 %conv16) nounwind
  %call52 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str10, i64 0, i64 0), i32 %conv17, i32 %conv17) nounwind
  %call53 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str11, i64 0, i64 0), i32 %add, i32 %add) nounwind
  %call54 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str12, i64 0, i64 0), i32 %add21, i32 %add21) nounwind
  %call55 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str13, i64 0, i64 0), i32 %conv16, i32 %conv16) nounwind
  %call56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([19 x i8]* @.str14, i64 0, i64 0), i32 %conv17, i32 %conv17) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

declare i64 @strtol(i8*, i8** nocapture, i32) nounwind

!0 = metadata !{metadata !"any pointer", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
