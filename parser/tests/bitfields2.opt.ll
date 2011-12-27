; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/bitfields2.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [12 x i8] c"i=%d, u=%d\0A\00", align 1
@.str1 = private unnamed_addr constant [20 x i8] c"bit.i=%d, bit.u=%d\0A\00", align 1
@.str2 = private unnamed_addr constant [38 x i8] c"unsigned_result=%d, signed_result=%d\0A\00", align 1
@.str3 = private unnamed_addr constant [13 x i8] c"i %% u = %d\0A\00", align 1
@.str5 = private unnamed_addr constant [28 x i8] c"i %% (unsigned int) u = %d\0A\00", align 1
@.str7 = private unnamed_addr constant [17 x i8] c"i %% bit.u = %d\0A\00", align 1
@.str9 = private unnamed_addr constant [21 x i8] c"bit.i %% bit.u = %d\0A\00", align 1
@.str11 = private unnamed_addr constant [32 x i8] c"i %% (unsigned int) bit.u = %d\0A\00", align 1
@.str13 = private unnamed_addr constant [36 x i8] c"bit.i %% (unsigned int) bit.u = %d\0A\00", align 1

define i32 @main() nounwind uwtable {
if.end78:
  %call = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([12 x i8]* @.str, i64 0, i64 0), i32 -13, i32 61) nounwind
  %call3 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([20 x i8]* @.str1, i64 0, i64 0), i32 -13, i32 61) nounwind
  %call6 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([38 x i8]* @.str2, i64 0, i64 0), i32 44, i32 -13) nounwind
  %call9 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([13 x i8]* @.str3, i64 0, i64 0), i32 44) nounwind
  %call18 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([28 x i8]* @.str5, i64 0, i64 0), i32 44) nounwind
  %call30 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([17 x i8]* @.str7, i64 0, i64 0), i32 -13) nounwind
  %call43 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str9, i64 0, i64 0), i32 -13) nounwind
  %call56 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([32 x i8]* @.str11, i64 0, i64 0), i32 44) nounwind
  %call69 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([36 x i8]* @.str13, i64 0, i64 0), i32 44) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind
