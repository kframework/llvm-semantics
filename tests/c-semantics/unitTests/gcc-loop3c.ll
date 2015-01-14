; ModuleID = './gcc-loop3c.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"a[0x10] || a[0x08] == %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @f(i32 %m) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %sh = alloca i32, align 4
  store i32 %m, i32* %1, align 4
  store i32 256, i32* %sh, align 4
  %2 = load i32* %1, align 4
  store i32 %2, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %14, %0
  %4 = load i32* %i, align 4
  %5 = shl i32 %4, 3
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %6
  %8 = load i32* %sh, align 4
  %9 = ashr i32 %8, 1
  store i32 %9, i32* %sh, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [255 x i8*]* @a, i32 0, i64 %10
  store i8* %7, i8** %11, align 8
  %12 = load i32* %i, align 4
  %13 = add nsw i32 %12, 4
  store i32 %13, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %3
  %15 = load i32* %i, align 4
  %16 = icmp slt i32 %15, 1073741840
  br i1 %16, label %3, label %17

; <label>:17                                      ; preds = %14
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void @f(i32 1610612736)
  %2 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %3 = icmp ne i8* %2, null
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %6 = icmp ne i8* %5, null
  br label %7

; <label>:7                                       ; preds = %4, %0
  %8 = phi i1 [ true, %0 ], [ %6, %4 ]
  %9 = zext i1 %8 to i32
  %10 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %9)
  %11 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %12 = icmp ne i8* %11, null
  br i1 %12, label %16, label %13

; <label>:13                                      ; preds = %7
  %14 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %15 = icmp ne i8* %14, null
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %13, %7
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %13
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  call void @f(i32 1073741824)
  %18 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %19 = icmp ne i8* %18, null
  br i1 %19, label %23, label %20

; <label>:20                                      ; preds = %17
  %21 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %22 = icmp ne i8* %21, null
  br label %23

; <label>:23                                      ; preds = %20, %17
  %24 = phi i1 [ true, %17 ], [ %22, %20 ]
  %25 = zext i1 %24 to i32
  %26 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([26 x i8]* @.str, i32 0, i32 0), i32 %25)
  %27 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 16), align 8
  %28 = icmp ne i8* %27, null
  br i1 %28, label %29, label %32

; <label>:29                                      ; preds = %23
  %30 = load i8** getelementptr inbounds ([255 x i8*]* @a, i32 0, i64 8), align 8
  %31 = icmp ne i8* %30, null
  br i1 %31, label %32, label %33

; <label>:32                                      ; preds = %29, %23
  call void @abort() #3
  unreachable

; <label>:33                                      ; preds = %29
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %35 = load i32* %1
  ret i32 %35
}

declare i32 @printf(i8*, ...) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
