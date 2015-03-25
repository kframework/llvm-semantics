; ModuleID = './20020206-2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.A = type { i16 }

; Function Attrs: nounwind uwtable
define void @foo(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = icmp ne i32 %2, 2048
  br i1 %3, label %4, label %8

; <label>:4                                       ; preds = %0
  %5 = load i32* %1, align 4
  %6 = icmp ne i32 %5, 2064
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4, %0
  ret void
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %i = alloca i32, align 4
  %4 = alloca %struct.A, align 2
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  store i32 0, i32* %i, align 4
  br label %5

; <label>:5                                       ; preds = %28, %0
  %6 = load i32* %i, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %31

; <label>:8                                       ; preds = %5
  %9 = getelementptr inbounds %struct.A* %4, i32 0, i32 0
  %10 = load i32* %i, align 4
  %11 = ashr i32 %10, 4
  %12 = icmp ne i32 %11, 0
  br i1 %12, label %14, label %13

; <label>:13                                      ; preds = %8
  br label %18

; <label>:14                                      ; preds = %8
  %15 = load i32* %i, align 4
  %16 = ashr i32 %15, 4
  %17 = add nsw i32 64, %16
  br label %18

; <label>:18                                      ; preds = %14, %13
  %19 = phi i32 [ 8, %13 ], [ %17, %14 ]
  %20 = shl i32 %19, 8
  %21 = load i32* %i, align 4
  %22 = shl i32 %21, 4
  %23 = add nsw i32 %20, %22
  %24 = trunc i32 %23 to i16
  store i16 %24, i16* %9, align 2
  %25 = getelementptr inbounds %struct.A* %4, i32 0, i32 0
  %26 = load i16* %25, align 2
  %27 = zext i16 %26 to i32
  call void @foo(i32 %27)
  br label %28

; <label>:28                                      ; preds = %18
  %29 = load i32* %i, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %i, align 4
  br label %5

; <label>:31                                      ; preds = %5
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %33 = load i32* %1
  ret i32 %33
}

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
