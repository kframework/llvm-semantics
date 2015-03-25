; ModuleID = './960311-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@count = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @a1() #0 {
  %1 = load i32* @count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @count, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @b(i8 zeroext %data) #0 {
  %1 = alloca i8, align 1
  store i8 %data, i8* %1, align 1
  %2 = load i8* %1, align 1
  %3 = zext i8 %2 to i32
  %4 = and i32 %3, 128
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @a1()
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = load i8* %1, align 1
  %9 = zext i8 %8 to i32
  %10 = shl i32 %9, 1
  %11 = trunc i32 %10 to i8
  store i8 %11, i8* %1, align 1
  %12 = load i8* %1, align 1
  %13 = zext i8 %12 to i32
  %14 = and i32 %13, 128
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  call void @a1()
  br label %17

; <label>:17                                      ; preds = %16, %7
  %18 = load i8* %1, align 1
  %19 = zext i8 %18 to i32
  %20 = shl i32 %19, 1
  %21 = trunc i32 %20 to i8
  store i8 %21, i8* %1, align 1
  %22 = load i8* %1, align 1
  %23 = zext i8 %22 to i32
  %24 = and i32 %23, 128
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %26, label %27

; <label>:26                                      ; preds = %17
  call void @a1()
  br label %27

; <label>:27                                      ; preds = %26, %17
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext 0)
  %2 = load i32* @count, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext -128)
  %6 = load i32* @count, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext 64)
  %10 = load i32* @count, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext 32)
  %14 = load i32* @count, align 4
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext -64)
  %18 = load i32* @count, align 4
  %19 = icmp ne i32 %18, 2
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext -96)
  %22 = load i32* @count, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext 96)
  %26 = load i32* @count, align 4
  %27 = icmp ne i32 %26, 2
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  store i32 0, i32* @count, align 4
  call void @b(i8 zeroext -32)
  %30 = load i32* @count, align 4
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %35 = load i32* %1
  ret i32 %35
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
