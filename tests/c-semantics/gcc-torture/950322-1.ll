; ModuleID = './950322-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @f(i8* %a) #0 {
  %1 = alloca i8*, align 8
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca i32, align 4
  store i8* %a, i8** %1, align 8
  %2 = load i8** %1, align 8
  %3 = getelementptr inbounds i8* %2, i64 1
  %4 = load i8* %3, align 1
  %5 = zext i8 %4 to i32
  store i32 %5, i32* %j, align 4
  %6 = load i8** %1, align 8
  %7 = getelementptr inbounds i8* %6, i64 0
  %8 = load i8* %7, align 1
  %9 = zext i8 %8 to i32
  %10 = load i32* %j, align 4
  %11 = sub nsw i32 %9, %10
  store i32 %11, i32* %i, align 4
  %12 = load i32* %i, align 4
  %13 = icmp slt i32 %12, 0
  br i1 %13, label %14, label %17

; <label>:14                                      ; preds = %0
  store i32 1, i32* %x, align 4
  %15 = load i32* %i, align 4
  %16 = sub nsw i32 0, %15
  store i32 %16, i32* %y, align 4
  br label %19

; <label>:17                                      ; preds = %0
  store i32 0, i32* %x, align 4
  %18 = load i32* %i, align 4
  store i32 %18, i32* %y, align 4
  br label %19

; <label>:19                                      ; preds = %17, %14
  %20 = load i32* %x, align 4
  %21 = load i32* %y, align 4
  %22 = add nsw i32 %20, %21
  ret i32 %22
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %a = alloca [2 x i8], align 1
  store i32 0, i32* %1
  %2 = getelementptr inbounds [2 x i8]* %a, i32 0, i64 0
  store i8 8, i8* %2, align 1
  %3 = getelementptr inbounds [2 x i8]* %a, i32 0, i64 1
  store i8 9, i8* %3, align 1
  %4 = getelementptr inbounds [2 x i8]* %a, i32 0, i32 0
  %5 = call i32 @f(i8* %4)
  %6 = icmp ne i32 %5, 2
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %10 = load i32* %1
  ret i32 %10
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
