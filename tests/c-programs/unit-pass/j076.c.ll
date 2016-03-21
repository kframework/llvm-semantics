; ModuleID = './j076.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a1 = common global [5 x i32] zeroinitializer, align 16
@a2 = common global [5 x double] zeroinitializer, align 16
@a3 = common global [5 x i32*] zeroinitializer, align 16
@a4 = common global [5 x i32] zeroinitializer, align 16
@a5 = common global [5 x i32 (i32, i32)*] zeroinitializer, align 16
@a6 = common global [7 x i32] zeroinitializer, align 16
@a7 = common global [5 x i32] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @f(i32 %n) #0 {
  %1 = alloca i32, align 4
  store i32 %n, i32* %1, align 4
  %2 = load i32, i32* %1, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %n = alloca i32, align 4
  %2 = alloca i8*
  %p = alloca [6 x i32]*, align 8
  store i32 0, i32* %1
  store i32 3, i32* %n, align 4
  %3 = load i32, i32* %n, align 4
  %4 = zext i32 %3 to i64
  %5 = call i8* @llvm.stacksave()
  store i8* %5, i8** %2
  %6 = alloca [6 x i32], i64 %4, align 16
  store [6 x i32]* %6, [6 x i32]** %p, align 8
  %7 = call i32 @f(i32 3)
  %8 = zext i32 %7 to i64
  store i32 0, i32* %1
  %9 = load i8*, i8** %2
  call void @llvm.stackrestore(i8* %9)
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
