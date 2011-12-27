; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/snprintf.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"%d, %x, %X\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d: %s\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %buf = alloca [300 x i8], align 16
  %tmp = getelementptr inbounds [300 x i8]* %buf, i64 0, i64 0
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 300, i32 16, i1 false)
  store i8 102, i8* %tmp, align 16
  %0 = getelementptr [300 x i8]* %buf, i64 0, i64 1
  store i8 111, i8* %0, align 1
  %1 = getelementptr [300 x i8]* %buf, i64 0, i64 2
  store i8 111, i8* %1, align 2
  %call = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* null, i64 0, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call, i8* %tmp) nounwind
  %call6 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 0, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call6, i8* %tmp) nounwind
  %call11 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 5, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call11, i8* %tmp) nounwind
  %call16 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 15, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call16, i8* %tmp) nounwind
  %call21 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 16, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call21, i8* %tmp) nounwind
  %call26 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 17, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call26, i8* %tmp) nounwind
  %call31 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %tmp, i64 30, i8* getelementptr inbounds ([11 x i8]* @.str, i64 0, i64 0), i32 35, i32 -35, i32 43) nounwind
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i64 0, i64 0), i32 %call31, i8* %tmp) nounwind
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @snprintf(i8* nocapture, i64, i8* nocapture, ...) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind
