; ModuleID = './20000403-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@aa = global [1 x i64] [i64 9223372036854771713], align 8
@bb = global [1 x i64] [i64 9223372036854771713], align 8

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0), align 8
  %3 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0), align 8
  %4 = call i32 @seqgt(i64 %2, i16 zeroext 4096, i64 %3)
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %0
  %7 = load i64* getelementptr inbounds ([1 x i64]* @aa, i32 0, i32 0), align 8
  %8 = load i64* getelementptr inbounds ([1 x i64]* @bb, i32 0, i32 0), align 8
  %9 = call i32 @seqgt2(i64 %7, i16 zeroext 4096, i64 %8)
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %12, label %11

; <label>:11                                      ; preds = %6, %0
  call void @abort() #2
  unreachable

; <label>:12                                      ; preds = %6
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %14 = load i32* %1
  ret i32 %14
}

; Function Attrs: nounwind uwtable
define i32 @seqgt(i64 %a, i16 zeroext %win, i64 %b) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i16, align 2
  %3 = alloca i64, align 8
  store i64 %a, i64* %1, align 8
  store i16 %win, i16* %2, align 2
  store i64 %b, i64* %3, align 8
  %4 = load i64* %1, align 8
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i64
  %7 = add i64 %4, %6
  %8 = load i64* %3, align 8
  %9 = sub i64 %7, %8
  %10 = icmp sgt i64 %9, 0
  %11 = zext i1 %10 to i32
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @seqgt2(i64 %a, i16 zeroext %win, i64 %b) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i16, align 2
  %3 = alloca i64, align 8
  %l = alloca i64, align 8
  store i64 %a, i64* %1, align 8
  store i16 %win, i16* %2, align 2
  store i64 %b, i64* %3, align 8
  %4 = load i64* %1, align 8
  %5 = load i16* %2, align 2
  %6 = zext i16 %5 to i64
  %7 = add i64 %4, %6
  %8 = load i64* %3, align 8
  %9 = sub i64 %7, %8
  store i64 %9, i64* %l, align 8
  %10 = load i64* %l, align 8
  %11 = icmp sgt i64 %10, 0
  %12 = zext i1 %11 to i32
  ret i32 %12
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
