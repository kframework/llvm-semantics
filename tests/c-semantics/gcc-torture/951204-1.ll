; ModuleID = './951204-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define void @f(i8* %x) #0 {
  %1 = alloca i8*, align 8
  store i8* %x, i8** %1, align 8
  %2 = load i8** %1, align 8
  store i8 120, i8* %2, align 1
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %x = alloca i8, align 1
  store i32 0, i32* %1
  store i8 0, i8* %x, align 1
  store i32 0, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = load i32* %i, align 4
  %4 = icmp slt i32 %3, 100
  br i1 %4, label %5, label %14

; <label>:5                                       ; preds = %2
  call void @f(i8* %x)
  %6 = load i8* %x, align 1
  %7 = sext i8 %6 to i32
  %8 = icmp ne i32 %7, 120
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:10                                      ; preds = %5
  br label %11

; <label>:11                                      ; preds = %10
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 1
  store i32 %13, i32* %i, align 4
  br label %2

; <label>:14                                      ; preds = %2
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %16 = load i32* %1
  ret i32 %16
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
