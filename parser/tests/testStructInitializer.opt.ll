; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/testStructInitializer.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, [2 x i8] }
%1 = type { i8, %0 }
%struct.anon = type { i8, i8* }
%struct.sa3 = type { i8, [0 x i8] }
%struct.sa3b = type { %struct.sa3, [3 x i8] }

@basicInit = global i32 5, align 4
@basicInit2 = global i8 10, align 1
@basicArr = global [2 x i32] [i32 15, i32 20], align 4
@.str = private unnamed_addr constant [3 x i8] c"62\00", align 1
@a1 = global %struct.anon { i8 52, i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0) }, align 8
@a2 = global %0 { i8 118, [2 x i8] c"cq" }, align 1
@a3 = global %struct.sa3b { %struct.sa3 { i8 111, [0 x i8] zeroinitializer }, [3 x i8] c"wx\00" }, align 1
@a4 = global %0 { i8 57, [2 x i8] c"eb" }, align 1
@a5 = global %1 { i8 57, %0 { i8 55, [2 x i8] c"zd" } }, align 1
@.str1 = private unnamed_addr constant [5 x i8] c"FAIL\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %tmp = load i32* @basicInit, align 4
  %cmp = icmp eq i32 %tmp, 5
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %tmp1 = load i8* @basicInit2, align 1
  %cmp2 = icmp eq i8 %tmp1, 10
  br i1 %cmp2, label %if.end6, label %if.then4

if.then4:                                         ; preds = %if.end
  %call5 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end6

if.end6:                                          ; preds = %if.end, %if.then4
  %tmp7 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i64 0, i64 0), align 4
  %cmp8 = icmp eq i32 %tmp7, 15
  br i1 %cmp8, label %if.end12, label %if.then10

if.then10:                                        ; preds = %if.end6
  %call11 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end12

if.end12:                                         ; preds = %if.end6, %if.then10
  %tmp13 = load i32* getelementptr inbounds ([2 x i32]* @basicArr, i64 0, i64 1), align 4
  %cmp14 = icmp eq i32 %tmp13, 20
  br i1 %cmp14, label %if.end18, label %if.then16

if.then16:                                        ; preds = %if.end12
  %call17 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end18

if.end18:                                         ; preds = %if.end12, %if.then16
  %tmp19 = load i8* getelementptr inbounds (%struct.anon* @a1, i64 0, i32 0), align 8
  %cmp21 = icmp eq i8 %tmp19, 52
  br i1 %cmp21, label %if.end25, label %if.then23

if.then23:                                        ; preds = %if.end18
  %call24 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end25

if.end25:                                         ; preds = %if.end18, %if.then23
  %tmp26 = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8
  %tmp27 = load i8* %tmp26, align 1
  %cmp29 = icmp eq i8 %tmp27, 54
  br i1 %cmp29, label %if.end33, label %if.then31

if.then31:                                        ; preds = %if.end25
  %call32 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  %tmp34.pre = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8
  br label %if.end33

if.end33:                                         ; preds = %if.end25, %if.then31
  %tmp34 = phi i8* [ %tmp26, %if.end25 ], [ %tmp34.pre, %if.then31 ]
  %arrayidx35 = getelementptr inbounds i8* %tmp34, i64 1
  %tmp36 = load i8* %arrayidx35, align 1
  %cmp38 = icmp eq i8 %tmp36, 50
  br i1 %cmp38, label %if.end42, label %if.then40

if.then40:                                        ; preds = %if.end33
  %call41 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  %tmp43.pre = load i8** getelementptr inbounds (%struct.anon* @a1, i64 0, i32 1), align 8
  br label %if.end42

if.end42:                                         ; preds = %if.end33, %if.then40
  %tmp43 = phi i8* [ %tmp34, %if.end33 ], [ %tmp43.pre, %if.then40 ]
  %arrayidx44 = getelementptr inbounds i8* %tmp43, i64 2
  %tmp45 = load i8* %arrayidx44, align 1
  %cmp47 = icmp eq i8 %tmp45, 0
  br i1 %cmp47, label %if.end51, label %if.then49

if.then49:                                        ; preds = %if.end42
  %call50 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end51

if.end51:                                         ; preds = %if.end42, %if.then49
  %tmp52 = load i8* getelementptr inbounds (%0* @a2, i64 0, i32 0), align 1
  %cmp54 = icmp eq i8 %tmp52, 118
  br i1 %cmp54, label %if.end58, label %if.then56

if.then56:                                        ; preds = %if.end51
  %call57 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end58

if.end58:                                         ; preds = %if.end51, %if.then56
  %tmp59 = load i8* getelementptr inbounds (%0* @a2, i64 0, i32 1, i64 0), align 1
  %cmp61 = icmp eq i8 %tmp59, 99
  br i1 %cmp61, label %if.end65, label %if.then63

if.then63:                                        ; preds = %if.end58
  %call64 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end65

if.end65:                                         ; preds = %if.end58, %if.then63
  %tmp66 = load i8* getelementptr inbounds (%0* @a2, i64 0, i32 1, i64 1), align 1
  %cmp68 = icmp eq i8 %tmp66, 113
  br i1 %cmp68, label %if.end72, label %if.then70

if.then70:                                        ; preds = %if.end65
  %call71 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end72

if.end72:                                         ; preds = %if.end65, %if.then70
  %tmp73 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 0, i32 0), align 1
  %cmp75 = icmp eq i8 %tmp73, 111
  br i1 %cmp75, label %if.end79, label %if.then77

if.then77:                                        ; preds = %if.end72
  %call78 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end79

if.end79:                                         ; preds = %if.end72, %if.then77
  %tmp80 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 1, i64 0), align 1
  %cmp82 = icmp eq i8 %tmp80, 119
  br i1 %cmp82, label %if.end86, label %if.then84

if.then84:                                        ; preds = %if.end79
  %call85 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end86

if.end86:                                         ; preds = %if.end79, %if.then84
  %tmp87 = load i8* getelementptr inbounds (%struct.sa3b* @a3, i64 0, i32 1, i64 1), align 1
  %cmp89 = icmp eq i8 %tmp87, 120
  br i1 %cmp89, label %if.end93, label %if.then91

if.then91:                                        ; preds = %if.end86
  %call92 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end93

if.end93:                                         ; preds = %if.end86, %if.then91
  %tmp94 = load i8* getelementptr inbounds (%0* @a4, i64 0, i32 0), align 1
  %cmp96 = icmp eq i8 %tmp94, 57
  br i1 %cmp96, label %if.end100, label %if.then98

if.then98:                                        ; preds = %if.end93
  %call99 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end100

if.end100:                                        ; preds = %if.end93, %if.then98
  %tmp101 = load i8* getelementptr inbounds (%0* @a4, i64 0, i32 1, i64 0), align 1
  %cmp103 = icmp eq i8 %tmp101, 101
  br i1 %cmp103, label %if.end107, label %if.then105

if.then105:                                       ; preds = %if.end100
  %call106 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end107

if.end107:                                        ; preds = %if.end100, %if.then105
  %tmp108 = load i8* getelementptr inbounds (%0* @a4, i64 0, i32 1, i64 1), align 1
  %cmp110 = icmp eq i8 %tmp108, 98
  br i1 %cmp110, label %if.end114, label %if.then112

if.then112:                                       ; preds = %if.end107
  %call113 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([5 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end114

if.end114:                                        ; preds = %if.end107, %if.then112
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
