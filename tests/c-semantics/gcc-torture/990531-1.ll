; ModuleID = './990531-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { i64 }

; Function Attrs: nounwind uwtable
define i64 @bad(i32 %reg, i64 %inWord) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i64, align 8
  %data = alloca %union.anon, align 8
  store i32 %reg, i32* %1, align 4
  store i64 %inWord, i64* %2, align 8
  %3 = load i64* %2, align 8
  %4 = bitcast %union.anon* %data to i64*
  store i64 %3, i64* %4, align 8
  %5 = load i32* %1, align 4
  %6 = sext i32 %5 to i64
  %7 = bitcast %union.anon* %data to [4 x i8]*
  %8 = getelementptr inbounds [4 x i8]* %7, i32 0, i64 %6
  store i8 0, i8* %8, align 1
  %9 = bitcast %union.anon* %data to i64*
  %10 = load i64* %9, align 8
  ret i64 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32* %1
  ret i32 %3
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
