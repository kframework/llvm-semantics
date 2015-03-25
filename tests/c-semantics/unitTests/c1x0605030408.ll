; ModuleID = './c1x0605030408.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @fsize3(i32 %n) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i8*
  %3 = alloca i32
  store i32 %n, i32* %1, align 4
  %4 = load i32* %1, align 4
  %5 = add nsw i32 %4, 3
  %6 = zext i32 %5 to i64
  %7 = call i8* @llvm.stacksave()
  store i8* %7, i8** %2
  %8 = alloca i8, i64 %6, align 16
  store i32 1, i32* %3
  %9 = load i8** %2
  call void @llvm.stackrestore(i8* %9)
  ret i64 %6
}

; Function Attrs: nounwind
declare i8* @llvm.stacksave() #1

; Function Attrs: nounwind
declare void @llvm.stackrestore(i8*) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %size = alloca i64, align 8
  store i32 0, i32* %1
  %2 = call i64 @fsize3(i32 10)
  store i64 %2, i64* %size, align 8
  %3 = load i64* %size, align 8
  %4 = trunc i64 %3 to i32
  ret i32 %4
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
