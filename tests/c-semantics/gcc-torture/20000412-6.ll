; ModuleID = './20000412-6.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@buf = global [5 x i16] [i16 1, i16 4, i16 16, i16 64, i16 256], align 2

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @bug(i16 zeroext 512, i16* getelementptr inbounds ([5 x i16]* @buf, i32 0, i32 0), i16* getelementptr inbounds ([5 x i16]* @buf, i32 0, i64 3))
  %3 = icmp ne i32 %2, 491
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32* %1
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @bug(i16 zeroext %value, i16* %buffer, i16* %bufend) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16*, align 8
  %3 = alloca i16*, align 8
  %tmp = alloca i16*, align 8
  store i16 %value, i16* %1, align 2
  store i16* %buffer, i16** %2, align 8
  store i16* %bufend, i16** %3, align 8
  %4 = load i16** %2, align 8
  store i16* %4, i16** %tmp, align 8
  br label %5

; <label>:5                                       ; preds = %17, %0
  %6 = load i16** %tmp, align 8
  %7 = load i16** %3, align 8
  %8 = icmp ult i16* %6, %7
  br i1 %8, label %9, label %20

; <label>:9                                       ; preds = %5
  %10 = load i16** %tmp, align 8
  %11 = load i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = load i16* %1, align 2
  %14 = zext i16 %13 to i32
  %15 = sub nsw i32 %14, %12
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* %1, align 2
  br label %17

; <label>:17                                      ; preds = %9
  %18 = load i16** %tmp, align 8
  %19 = getelementptr inbounds i16* %18, i32 1
  store i16* %19, i16** %tmp, align 8
  br label %5

; <label>:20                                      ; preds = %5
  %21 = load i16* %1, align 2
  %22 = zext i16 %21 to i32
  ret i32 %22
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
