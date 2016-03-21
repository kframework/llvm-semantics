; ModuleID = './j033.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.a = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@.str = private unnamed_addr constant [6 x i8] c"hello\00", align 1
@main.c = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1
@.str.1 = private unnamed_addr constant [7 x i8] c"hello\0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [6 x i8], align 1
  %b = alloca [6 x i8]*, align 8
  %c = alloca [7 x i8], align 1
  store i32 0, i32* %1
  %2 = bitcast [6 x i8]* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([6 x i8], [6 x i8]* @main.a, i32 0, i32 0), i64 6, i32 1, i1 false)
  %3 = getelementptr inbounds [6 x i8], [6 x i8]* %a, i32 0, i64 0
  store i8 120, i8* %3, align 1
  store [6 x i8]* @.str, [6 x i8]** %b, align 8
  %4 = load [6 x i8]*, [6 x i8]** %b, align 8
  %5 = getelementptr inbounds [6 x i8], [6 x i8]* %4, i32 0, i64 0
  %6 = load i8, i8* %5, align 1
  %7 = bitcast [7 x i8]* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %7, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @main.c, i32 0, i32 0), i64 7, i32 1, i1 false)
  %8 = getelementptr inbounds [7 x i8], [7 x i8]* %c, i32 0, i64 0
  store i8 120, i8* %8, align 1
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.1, i32 0, i32 0))
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

declare i32 @printf(i8*, ...) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
