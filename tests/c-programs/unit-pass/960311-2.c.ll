; ModuleID = './960311-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@count = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define void @a1() #0 {
  %1 = load i32, i32* @count, align 4
  %2 = add nsw i32 %1, 1
  store i32 %2, i32* @count, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define void @b(i16 zeroext %data) #0 {
  %1 = alloca i16, align 2
  store i16 %data, i16* %1, align 2
  %2 = load i16, i16* %1, align 2
  %3 = zext i16 %2 to i32
  %4 = and i32 %3, 32768
  %5 = icmp ne i32 %4, 0
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @a1()
  br label %7

; <label>:7                                       ; preds = %6, %0
  %8 = load i16, i16* %1, align 2
  %9 = zext i16 %8 to i32
  %10 = shl i32 %9, 1
  %11 = trunc i32 %10 to i16
  store i16 %11, i16* %1, align 2
  %12 = load i16, i16* %1, align 2
  %13 = zext i16 %12 to i32
  %14 = and i32 %13, 32768
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %7
  call void @a1()
  br label %17

; <label>:17                                      ; preds = %16, %7
  %18 = load i16, i16* %1, align 2
  %19 = zext i16 %18 to i32
  %20 = shl i32 %19, 1
  %21 = trunc i32 %20 to i16
  store i16 %21, i16* %1, align 2
  %22 = load i16, i16* %1, align 2
  %23 = zext i16 %22 to i32
  %24 = and i32 %23, 32768
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
  call void @b(i16 zeroext 0)
  %2 = load i32, i32* @count, align 4
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -32768)
  %6 = load i32, i32* @count, align 4
  %7 = icmp ne i32 %6, 1
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %5
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %5
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 16384)
  %10 = load i32, i32* @count, align 4
  %11 = icmp ne i32 %10, 1
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %9
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %9
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 8192)
  %14 = load i32, i32* @count, align 4
  %15 = icmp ne i32 %14, 1
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13
  call void @abort() #2
  unreachable

; <label>:17                                      ; preds = %13
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -16384)
  %18 = load i32, i32* @count, align 4
  %19 = icmp ne i32 %18, 2
  br i1 %19, label %20, label %21

; <label>:20                                      ; preds = %17
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %17
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -24576)
  %22 = load i32, i32* @count, align 4
  %23 = icmp ne i32 %22, 2
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %21
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext 24576)
  %26 = load i32, i32* @count, align 4
  %27 = icmp ne i32 %26, 2
  br i1 %27, label %28, label %29

; <label>:28                                      ; preds = %25
  call void @abort() #2
  unreachable

; <label>:29                                      ; preds = %25
  store i32 0, i32* @count, align 4
  call void @b(i16 zeroext -8192)
  %30 = load i32, i32* @count, align 4
  %31 = icmp ne i32 %30, 3
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29
  call void @abort() #2
  unreachable

; <label>:33                                      ; preds = %29
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %35 = load i32, i32* %1
  ret i32 %35
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
