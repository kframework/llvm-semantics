; ModuleID = './divmod-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @div1(i8 signext %x) #0 {
  %1 = alloca i8, align 1
  store i8 %x, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = sdiv i32 %3, -1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @div2(i16 signext %x) #0 {
  %1 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = sdiv i32 %3, -1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @div3(i8 signext %x, i8 signext %y) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %x, i8* %1, align 1
  store i8 %y, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = sdiv i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @div4(i16 signext %x, i16 signext %y) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  store i16 %y, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = sdiv i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @mod1(i8 signext %x) #0 {
  %1 = alloca i8, align 1
  store i8 %x, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = sext i8 %2 to i32
  %4 = srem i32 %3, -1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @mod2(i16 signext %x) #0 {
  %1 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  %2 = load i16* %1, align 2
  %3 = sext i16 %2 to i32
  %4 = srem i32 %3, -1
  ret i32 %4
}

; Function Attrs: nounwind uwtable
define i32 @mod3(i8 signext %x, i8 signext %y) #0 {
  %1 = alloca i8, align 1
  %2 = alloca i8, align 1
  store i8 %x, i8* %1, align 1
  store i8 %y, i8* %2, align 1
  %3 = load i8* %1, align 1
  %4 = sext i8 %3 to i32
  %5 = load i8* %2, align 1
  %6 = sext i8 %5 to i32
  %7 = srem i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i32 @mod4(i16 signext %x, i16 signext %y) #0 {
  %1 = alloca i16, align 2
  %2 = alloca i16, align 2
  store i16 %x, i16* %1, align 2
  store i16 %y, i16* %2, align 2
  %3 = load i16* %1, align 2
  %4 = sext i16 %3 to i32
  %5 = load i16* %2, align 2
  %6 = sext i16 %5 to i32
  %7 = srem i32 %4, %6
  ret i32 %7
}

; Function Attrs: nounwind uwtable
define i64 @mod5(i64 %x, i64 %y) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  store i64 %y, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = srem i64 %3, %4
  ret i64 %5
}

; Function Attrs: nounwind uwtable
define i64 @mod6(i64 %x, i64 %y) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i64, align 8
  store i64 %x, i64* %1, align 8
  store i64 %y, i64* %2, align 8
  %3 = load i64* %1, align 8
  %4 = load i64* %2, align 8
  %5 = urem i64 %3, %4
  ret i64 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @div1(i8 signext -128)
  %3 = icmp ne i32 %2, 128
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  %6 = call i32 @div2(i16 signext -32768)
  %7 = icmp ne i32 %6, 32768
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  %10 = call i32 @div3(i8 signext -128, i8 signext -1)
  %11 = icmp ne i32 %10, 128
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  %14 = call i32 @div4(i16 signext -32768, i16 signext -1)
  %15 = icmp ne i32 %14, 32768
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  %18 = call i32 @mod1(i8 signext -128)
  %19 = icmp ne i32 %18, 0
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  %22 = call i32 @mod2(i16 signext -32768)
  %23 = icmp ne i32 %22, 0
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  %26 = call i32 @mod3(i8 signext -128, i8 signext -1)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  %30 = call i32 @mod4(i16 signext -32768, i16 signext -1)
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  %34 = call i64 @mod5(i64 1342177280, i64 2)
  %35 = icmp ne i64 %34, 0
  br i1 %35, label %36, label %37

; <label>:36                                      ; preds = %33
  call void @abort() #2
  unreachable

; <label>:37                                      ; preds = %33
  %38 = call i64 @mod6(i64 1342177280, i64 2)
  %39 = icmp ne i64 %38, 0
  br i1 %39, label %40, label %41

; <label>:40                                      ; preds = %37
  call void @abort() #2
  unreachable

; <label>:41                                      ; preds = %37
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %43 = load i32* %1
  ret i32 %43
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
