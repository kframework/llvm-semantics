; ModuleID = './snprintf.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [11 x i8] c"%d, %x, %X\00", align 1
@.str.1 = private unnamed_addr constant [8 x i8] c"%d: %s\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %buf = alloca [300 x i8], align 16
  %retval = alloca i32, align 4
  %1 = bitcast [300 x i8]* %buf to i8*
  call void @llvm.memset.p0i8.i64(i8* %1, i8 0, i64 300, i32 16, i1 false)
  %2 = bitcast i8* %1 to [300 x i8]*
  %3 = getelementptr [300 x i8], [300 x i8]* %2, i32 0, i32 0
  store i8 102, i8* %3
  %4 = getelementptr [300 x i8], [300 x i8]* %2, i32 0, i32 1
  store i8 111, i8* %4
  %5 = getelementptr [300 x i8], [300 x i8]* %2, i32 0, i32 2
  store i8 111, i8* %5
  %6 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* null, i64 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %6, i32* %retval, align 4
  %7 = load i32, i32* %retval, align 4
  %8 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %7, i8* %8)
  %10 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %11 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %10, i64 0, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %11, i32* %retval, align 4
  %12 = load i32, i32* %retval, align 4
  %13 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %14 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %12, i8* %13)
  %15 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %16 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %15, i64 5, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %16, i32* %retval, align 4
  %17 = load i32, i32* %retval, align 4
  %18 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %17, i8* %18)
  %20 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %21 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %20, i64 15, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %21, i32* %retval, align 4
  %22 = load i32, i32* %retval, align 4
  %23 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %24 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %22, i8* %23)
  %25 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %26 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %25, i64 16, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %26, i32* %retval, align 4
  %27 = load i32, i32* %retval, align 4
  %28 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %29 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %27, i8* %28)
  %30 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %31 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %30, i64 17, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %31, i32* %retval, align 4
  %32 = load i32, i32* %retval, align 4
  %33 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %34 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %32, i8* %33)
  %35 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %36 = call i32 (i8*, i64, i8*, ...) @snprintf(i8* %35, i64 30, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str, i32 0, i32 0), i32 35, i32 -35, i32 43) #1
  store i32 %36, i32* %retval, align 4
  %37 = load i32, i32* %retval, align 4
  %38 = getelementptr inbounds [300 x i8], [300 x i8]* %buf, i32 0, i32 0
  %39 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %37, i8* %38)
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: nounwind
declare i32 @snprintf(i8*, i64, i8*, ...) #2

declare i32 @printf(i8*, ...) #3

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
