; ModuleID = './2002-05-19-DivTest.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@.str = private unnamed_addr constant [4 x i8] c"%d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @testL(i64 %Arg) #0 {
  %1 = alloca i64, align 8
  store i64 %Arg, i64* %1, align 8
  %2 = load i64, i64* %1, align 8
  %3 = sdiv i64 %2, 16
  %4 = trunc i64 %3 to i32
  %5 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %4)
  %6 = load i64, i64* %1, align 8
  %7 = sdiv i64 %6, 70368744177664
  %8 = trunc i64 %7 to i32
  %9 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %8)
  ret void
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: nounwind uwtable
define void @test(i32 %Arg) #0 {
  %1 = alloca i32, align 4
  store i32 %Arg, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  %3 = sdiv i32 %2, 1
  %4 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %3)
  %5 = load i32, i32* %1, align 4
  %6 = sdiv i32 %5, 16
  %7 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %6)
  %8 = load i32, i32* %1, align 4
  %9 = sdiv i32 %8, 262144
  %10 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load i32, i32* %1, align 4
  %12 = sdiv i32 %11, 1073741824
  %13 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str, i32 0, i32 0), i32 %12)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %B20 = alloca i32, align 4
  %B53 = alloca i64, align 8
  store i32 0, i32* %1
  store i32 -1048576, i32* %B20, align 4
  store i64 -9007199254740992, i64* %B53, align 8
  %2 = load i32, i32* %B20, align 4
  %3 = add nsw i32 %2, 32
  call void @test(i32 %3)
  %4 = load i32, i32* %B20, align 4
  %5 = add nsw i32 %4, 33
  call void @test(i32 %5)
  %6 = load i64, i64* %B53, align 8
  %7 = add nsw i64 %6, 64
  call void @testL(i64 %7)
  %8 = load i64, i64* %B53, align 8
  %9 = add nsw i64 %8, 65
  call void @testL(i64 %9)
  ret i32 0
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
