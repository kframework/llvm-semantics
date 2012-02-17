; ModuleID = '/home/grosu/celliso2/c-semantics/tests/csmith/smith001487.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@g_12 = constant i32 -2, align 4
@g_14 = global [9 x i32] [i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478, i32 -75465478], align 16
@g_22 = global [9 x [5 x i32*]] zeroinitializer, align 16
@g_24 = global i32 242716774, align 4
@g_23 = global i32* @g_24, align 8
@g_49 = global i32* null, align 8
@g_48 = global [7 x i32**] [i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49, i32** @g_49], align 16
@g_50 = global i32** null, align 8
@g_51 = global [9 x [1 x [6 x [1 x [1 x [1 x i32**]]]]]] [[1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]], [1 x [6 x [1 x [1 x [1 x i32**]]]]] [[6 x [1 x [1 x [1 x i32**]]]] [[1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]], [1 x [1 x [1 x i32**]]] [[1 x [1 x i32**]] [[1 x i32**] [i32** @g_49]]]]]], align 16
@g_52 = global i32** null, align 8
@.str = private unnamed_addr constant [20 x i8] c"checksum g_12 = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [23 x i8] c"checksum g_14[0] = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [23 x i8] c"checksum g_14[1] = %d\0A\00", align 1
@.str3 = private unnamed_addr constant [23 x i8] c"checksum g_14[2] = %d\0A\00", align 1
@.str4 = private unnamed_addr constant [23 x i8] c"checksum g_14[3] = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [23 x i8] c"checksum g_14[4] = %d\0A\00", align 1
@.str6 = private unnamed_addr constant [23 x i8] c"checksum g_14[5] = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [23 x i8] c"checksum g_14[6] = %d\0A\00", align 1
@.str8 = private unnamed_addr constant [23 x i8] c"checksum g_14[7] = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [23 x i8] c"checksum g_14[8] = %d\0A\00", align 1
@.str10 = private unnamed_addr constant [20 x i8] c"checksum g_24 = %d\0A\00", align 1
@__undefined = common global i64 0, align 8

define signext i8 @func_1() nounwind uwtable {
if.then:
  ret i8 -2
}

define i32 @func_7(i8 signext %p_8, i8 zeroext %p_9, i32 %p_10) nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32* @func_36(i32* nocapture %p_37) nounwind uwtable readnone {
entry:
  ret i32* @g_24
}

define i32 @main(i32 %argc, i8** nocapture %argv) nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str, i64 0, i64 0), i32 -2) nounwind
  %tmp = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 0), align 16
  %call2 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str1, i64 0, i64 0), i32 %tmp) nounwind
  %tmp3 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 1), align 4
  %call4 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str2, i64 0, i64 0), i32 %tmp3) nounwind
  %tmp5 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 2), align 8
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str3, i64 0, i64 0), i32 %tmp5) nounwind
  %tmp7 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 3), align 4
  %call8 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str4, i64 0, i64 0), i32 %tmp7) nounwind
  %tmp9 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 4), align 16
  %call10 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str5, i64 0, i64 0), i32 %tmp9) nounwind
  %tmp11 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 5), align 4
  %call12 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str6, i64 0, i64 0), i32 %tmp11) nounwind
  %tmp13 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 6), align 8
  %call14 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str7, i64 0, i64 0), i32 %tmp13) nounwind
  %tmp15 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 7), align 4
  %call16 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str8, i64 0, i64 0), i32 %tmp15) nounwind
  %tmp17 = load i32* getelementptr inbounds ([9 x i32]* @g_14, i64 0, i64 8), align 16
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([23 x i8]* @.str9, i64 0, i64 0), i32 %tmp17) nounwind
  %tmp19 = load i32* @g_24, align 4
  %call20 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str10, i64 0, i64 0), i32 %tmp19) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
