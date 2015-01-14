; ModuleID = './pr20100-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@g = internal global i16 0, align 2
@p = internal global i16 0, align 2
@e = common global i8 0, align 1

; Function Attrs: nounwind uwtable
define signext i8 @frob(i16 zeroext %a, i16 zeroext %b) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %a, i16* %1, align 2
  store i16 %b, i16* %2, align 2
  %3 = load i16* %1, align 2
  store i16 %3, i16* @g, align 2
  %4 = load i16* %2, align 2
  store i16 %4, i16* @p, align 2
  %5 = call zeroext i16 @inc_g()
  %6 = call signext i8 @ring_empty()
  ret i8 %6
}

; Function Attrs: nounwind uwtable
define internal zeroext i16 @inc_g() #0 {
  %1 = call zeroext i16 @next_g()
  store i16 %1, i16* @g, align 2
  ret i16 %1
}

; Function Attrs: nounwind uwtable
define internal signext i8 @ring_empty() #0 {
  %1 = alloca i8, align 1
  %2 = call zeroext i16 @curr_p()
  %3 = zext i16 %2 to i32
  %4 = call zeroext i16 @curr_g()
  %5 = zext i16 %4 to i32
  %6 = icmp eq i32 %3, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  store i8 1, i8* %1
  br label %9

; <label>:8                                       ; preds = %0
  store i8 0, i8* %1
  br label %9

; <label>:9                                       ; preds = %8, %7
  %10 = load i8* %1
  ret i8 %10
}

; Function Attrs: nounwind uwtable
define zeroext i16 @get_n() #0 {
  %n = alloca i16, align 2
  %org_g = alloca i16, align 2
  store i16 0, i16* %n, align 2
  %1 = call zeroext i16 @curr_g()
  store i16 %1, i16* %org_g, align 2
  br label %2

; <label>:2                                       ; preds = %11, %0
  %3 = call signext i8 @ring_empty()
  %4 = icmp ne i8 %3, 0
  br i1 %4, label %9, label %5

; <label>:5                                       ; preds = %2
  %6 = load i16* %n, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp slt i32 %7, 5
  br label %9

; <label>:9                                       ; preds = %5, %2
  %10 = phi i1 [ false, %2 ], [ %8, %5 ]
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %9
  %12 = call zeroext i16 @inc_g()
  %13 = load i16* %n, align 2
  %14 = add i16 %13, 1
  store i16 %14, i16* %n, align 2
  br label %2

; <label>:15                                      ; preds = %9
  %16 = load i16* %n, align 2
  ret i16 %16
}

; Function Attrs: nounwind uwtable
define internal zeroext i16 @curr_g() #0 {
  %1 = load i16* @g, align 2
  ret i16 %1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8 3, i8* @e, align 1
  %2 = call signext i8 @frob(i16 zeroext 0, i16 zeroext 2)
  %3 = sext i8 %2 to i32
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %29, label %5

; <label>:5                                       ; preds = %0
  %6 = load i16* @g, align 2
  %7 = zext i16 %6 to i32
  %8 = icmp ne i32 %7, 1
  br i1 %8, label %29, label %9

; <label>:9                                       ; preds = %5
  %10 = load i16* @p, align 2
  %11 = zext i16 %10 to i32
  %12 = icmp ne i32 %11, 2
  br i1 %12, label %29, label %13

; <label>:13                                      ; preds = %9
  %14 = load i8* @e, align 1
  %15 = zext i8 %14 to i32
  %16 = icmp ne i32 %15, 3
  br i1 %16, label %29, label %17

; <label>:17                                      ; preds = %13
  %18 = call zeroext i16 @get_n()
  %19 = zext i16 %18 to i32
  %20 = icmp ne i32 %19, 1
  br i1 %20, label %29, label %21

; <label>:21                                      ; preds = %17
  %22 = load i16* @g, align 2
  %23 = zext i16 %22 to i32
  %24 = icmp ne i32 %23, 2
  br i1 %24, label %29, label %25

; <label>:25                                      ; preds = %21
  %26 = load i16* @p, align 2
  %27 = zext i16 %26 to i32
  %28 = icmp ne i32 %27, 2
  br i1 %28, label %29, label %30

; <label>:29                                      ; preds = %25, %21, %17, %13, %9, %5, %0
  call void @abort() #2
  unreachable

; <label>:30                                      ; preds = %25
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %32 = load i32* %1
  ret i32 %32
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define internal zeroext i16 @curr_p() #0 {
  %1 = load i16* @p, align 2
  ret i16 %1
}

; Function Attrs: nounwind uwtable
define internal zeroext i16 @next_g() #0 {
  %1 = load i16* @g, align 2
  %2 = zext i16 %1 to i32
  %3 = load i8* @e, align 1
  %4 = zext i8 %3 to i32
  %5 = sub nsw i32 %4, 1
  %6 = icmp eq i32 %2, %5
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  br label %12

; <label>:8                                       ; preds = %0
  %9 = load i16* @g, align 2
  %10 = zext i16 %9 to i32
  %11 = add nsw i32 %10, 1
  br label %12

; <label>:12                                      ; preds = %8, %7
  %13 = phi i32 [ 0, %7 ], [ %11, %8 ]
  %14 = trunc i32 %13 to i16
  ret i16 %14
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
