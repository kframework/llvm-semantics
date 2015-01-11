; ModuleID = './xrealloc4.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p1 = alloca i8*, align 8
  %p2 = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 5) #2
  store i8* %2, i8** %p1, align 8
  %3 = load i8** %p1, align 8
  %4 = getelementptr inbounds i8* %3, i64 4
  store i8 100, i8* %4, align 1
  %5 = load i8** %p1, align 8
  %6 = call i8* @realloc(i8* %5, i64 5) #2
  store i8* %6, i8** %p2, align 8
  %7 = load i8** %p2, align 8
  %8 = getelementptr inbounds i8* %7, i64 4
  %9 = load i8* %8, align 1
  ret i32 0
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

; Function Attrs: nounwind
declare i8* @realloc(i8*, i64) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
