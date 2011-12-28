; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/snprintf.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"%d, %x, %X\00", align 1
@.str1 = private unnamed_addr constant [8 x i8] c"%d: %s\0A\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [300 x i8], align 16
  %retval2 = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast [300 x i8]* %buf to i8*
  call void @llvm.memset.p0i8.i64(i8* %tmp, i8 0, i64 300, i32 16, i1 false)
  %0 = bitcast i8* %tmp to [300 x i8]*
  %1 = getelementptr [300 x i8]* %0, i32 0, i32 0
  store i8 102, i8* %1
  %2 = getelementptr [300 x i8]* %0, i32 0, i32 1
  store i8 111, i8* %2
  %3 = getelementptr [300 x i8]* %0, i32 0, i32 2
  store i8 111, i8* %3
  %call = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* null, i64 0, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call, i32* %retval2, align 4
  %tmp3 = load i32* %retval2, align 4
  %arraydecay = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call4 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp3, i8* %arraydecay)
  %arraydecay5 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call6 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay5, i64 0, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call6, i32* %retval2, align 4
  %tmp7 = load i32* %retval2, align 4
  %arraydecay8 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call9 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp7, i8* %arraydecay8)
  %arraydecay10 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call11 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay10, i64 5, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call11, i32* %retval2, align 4
  %tmp12 = load i32* %retval2, align 4
  %arraydecay13 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call14 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp12, i8* %arraydecay13)
  %arraydecay15 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call16 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay15, i64 15, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call16, i32* %retval2, align 4
  %tmp17 = load i32* %retval2, align 4
  %arraydecay18 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call19 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp17, i8* %arraydecay18)
  %arraydecay20 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call21 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay20, i64 16, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call21, i32* %retval2, align 4
  %tmp22 = load i32* %retval2, align 4
  %arraydecay23 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call24 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp22, i8* %arraydecay23)
  %arraydecay25 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call26 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay25, i64 17, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call26, i32* %retval2, align 4
  %tmp27 = load i32* %retval2, align 4
  %arraydecay28 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call29 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp27, i8* %arraydecay28)
  %arraydecay30 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call31 = call i32 (i8*, i64, i8*, ...)* @snprintf(i8* %arraydecay30, i64 30, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) nounwind
  store i32 %call31, i32* %retval2, align 4
  %tmp32 = load i32* %retval2, align 4
  %arraydecay33 = getelementptr inbounds [300 x i8]* %buf, i32 0, i32 0
  %call34 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([8 x i8]* @.str1, i32 0, i32 0), i32 %tmp32, i8* %arraydecay33)
  %4 = load i32* %retval
  ret i32 %4
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare i32 @snprintf(i8*, i64, i8*, ...) nounwind

declare i32 @printf(i8*, ...)
