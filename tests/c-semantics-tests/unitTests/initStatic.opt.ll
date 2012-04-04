; ModuleID = '/home/david/src/c-semantics/tests/unitTests/initStatic.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }
%struct.anon.0 = type { i32, i32 }
%union.anon.1 = type { i32 }

@y = global i32 5, align 4
@pair = global %struct.anon { i32 2, i32 3 }, align 4
@un2 = global { i8, [3 x i8] } { i8 120, [3 x i8] undef }, align 4
@x = common global i32 0, align 4
@.str = private unnamed_addr constant [8 x i8] c"x != 0\0A\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"y != 5\0A\00", align 1
@pt = common global %struct.anon.0 zeroinitializer, align 4
@.str2 = private unnamed_addr constant [11 x i8] c"pt.x != 0\0A\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"pt.y != 0\0A\00", align 1
@.str4 = private unnamed_addr constant [13 x i8] c"pair.x != 2\0A\00", align 1
@.str5 = private unnamed_addr constant [13 x i8] c"pair.y != 3\0A\00", align 1
@un = common global %union.anon.1 zeroinitializer, align 4
@.str6 = private unnamed_addr constant [11 x i8] c"un.x != 0\0A\00", align 1
@.str7 = private unnamed_addr constant [14 x i8] c"un2.x != 'x'\0A\00", align 1
@arr = common global [5 x i32] zeroinitializer, align 16
@.str8 = private unnamed_addr constant [13 x i8] c"arr[0] != 0\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %0 = load i32* @x, align 4, !tbaa !0
  %cmp = icmp eq i32 %0, 0
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str, i64 0, i64 0)) nounwind
  br label %if.end

if.end:                                           ; preds = %entry, %if.then
  %1 = load i32* @y, align 4, !tbaa !0
  %cmp1 = icmp eq i32 %1, 5
  br i1 %cmp1, label %if.end4, label %if.then2

if.then2:                                         ; preds = %if.end
  %call3 = tail call i32 @puts(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0)) nounwind
  br label %if.end4

if.end4:                                          ; preds = %if.end, %if.then2
  %2 = load i32* getelementptr inbounds (%struct.anon.0* @pt, i64 0, i32 0), align 4, !tbaa !0
  %cmp5 = icmp eq i32 %2, 0
  br i1 %cmp5, label %if.end8, label %if.then6

if.then6:                                         ; preds = %if.end4
  %call7 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str2, i64 0, i64 0)) nounwind
  br label %if.end8

if.end8:                                          ; preds = %if.end4, %if.then6
  %3 = load i32* getelementptr inbounds (%struct.anon.0* @pt, i64 0, i32 1), align 4, !tbaa !0
  %cmp9 = icmp eq i32 %3, 0
  br i1 %cmp9, label %if.end12, label %if.then10

if.then10:                                        ; preds = %if.end8
  %call11 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str3, i64 0, i64 0)) nounwind
  br label %if.end12

if.end12:                                         ; preds = %if.end8, %if.then10
  %4 = load i32* getelementptr inbounds (%struct.anon* @pair, i64 0, i32 0), align 4, !tbaa !0
  %cmp13 = icmp eq i32 %4, 2
  br i1 %cmp13, label %if.end16, label %if.then14

if.then14:                                        ; preds = %if.end12
  %call15 = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str4, i64 0, i64 0)) nounwind
  br label %if.end16

if.end16:                                         ; preds = %if.end12, %if.then14
  %5 = load i32* getelementptr inbounds (%struct.anon* @pair, i64 0, i32 1), align 4, !tbaa !0
  %cmp17 = icmp eq i32 %5, 3
  br i1 %cmp17, label %if.end20, label %if.then18

if.then18:                                        ; preds = %if.end16
  %call19 = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str5, i64 0, i64 0)) nounwind
  br label %if.end20

if.end20:                                         ; preds = %if.end16, %if.then18
  %6 = load i8* bitcast (%union.anon.1* @un to i8*), align 4, !tbaa !1
  %cmp21 = icmp eq i8 %6, 0
  br i1 %cmp21, label %if.end25, label %if.then23

if.then23:                                        ; preds = %if.end20
  %call24 = tail call i32 @puts(i8* getelementptr inbounds ([11 x i8]* @.str6, i64 0, i64 0)) nounwind
  br label %if.end25

if.end25:                                         ; preds = %if.end20, %if.then23
  %7 = load i8* getelementptr inbounds ({ i8, [3 x i8] }* @un2, i64 0, i32 0), align 4, !tbaa !1
  %cmp27 = icmp eq i8 %7, 120
  br i1 %cmp27, label %if.end31, label %if.then29

if.then29:                                        ; preds = %if.end25
  %call30 = tail call i32 @puts(i8* getelementptr inbounds ([14 x i8]* @.str7, i64 0, i64 0)) nounwind
  br label %if.end31

if.end31:                                         ; preds = %if.end25, %if.then29
  %8 = load i32* getelementptr inbounds ([5 x i32]* @arr, i64 0, i64 0), align 16, !tbaa !0
  %cmp32 = icmp eq i32 %8, 0
  br i1 %cmp32, label %if.end36, label %if.then34

if.then34:                                        ; preds = %if.end31
  %call35 = tail call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str8, i64 0, i64 0)) nounwind
  br label %if.end36

if.end36:                                         ; preds = %if.end31, %if.then34
  ret i32 0
}

declare i32 @puts(i8* nocapture) nounwind

!0 = metadata !{metadata !"int", metadata !1}
!1 = metadata !{metadata !"omnipotent char", metadata !2}
!2 = metadata !{metadata !"Simple C/C++ TBAA", null}
