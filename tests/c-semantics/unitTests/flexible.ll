; ModuleID = './flexible.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct._s = type { i32, [0 x i32] }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct._s*, align 8
  store i32 0, i32* %1
  %2 = call noalias i8* @malloc(i64 24) #2
  %3 = bitcast i8* %2 to %struct._s*
  store %struct._s* %3, %struct._s** %p, align 8
  %4 = load %struct._s** %p, align 8
  %5 = getelementptr inbounds %struct._s* %4, i32 0, i32 1
  %6 = getelementptr inbounds [0 x i32]* %5, i32 0, i64 2
  store i32 5, i32* %6, align 1
  %7 = load %struct._s** %p, align 8
  %8 = getelementptr inbounds %struct._s* %7, i32 0, i32 1
  %9 = getelementptr inbounds [0 x i32]* %8, i32 0, i64 2
  %10 = load i32* %9, align 1
  ret i32 %10
}

; Function Attrs: nounwind
declare noalias i8* @malloc(i64) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
