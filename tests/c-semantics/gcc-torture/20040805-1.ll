; ModuleID = './20040805-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = global [2 x i32] [i32 2, i32 3], align 4

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo(i32 100)
  %3 = icmp ne i32 %2, 102
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @foo(i32 %x) #1 {
  %1 = alloca i32, align 4
  %buf = alloca [65536 x i8], align 16
  %y = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  store i32 %2, i32* %y, align 4
  %3 = load i32* %y, align 4
  store i32 %3, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 1), align 4
  %4 = load i32* %1, align 4
  %5 = getelementptr inbounds [65536 x i8]* %buf, i32 0, i32 0
  %6 = call i32 @bar(i32 %4, i8* %5)
  store i32 %6, i32* %1, align 4
  %7 = load i32* %y, align 4
  %8 = getelementptr inbounds [65536 x i8]* %buf, i32 0, i32 0
  %9 = call i32 @bar(i32 %7, i8* %8)
  store i32 %9, i32* %y, align 4
  %10 = load i32* %1, align 4
  %11 = load i32* %y, align 4
  %12 = add nsw i32 %10, %11
  ret i32 %12
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

; Function Attrs: noinline nounwind uwtable
define internal i32 @bar(i32 %x, i8* %b) #1 {
  %1 = alloca i32, align 4
  %2 = alloca i8*, align 8
  store i32 %x, i32* %1, align 4
  store i8* %b, i8** %2, align 8
  %3 = load i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %4 = add nsw i32 %3, 1
  store i32 %4, i32* getelementptr inbounds ([2 x i32]* @a, i32 0, i64 0), align 4
  %5 = load i32* %1, align 4
  ret i32 %5
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
