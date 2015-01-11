; ModuleID = './990128-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { %struct.s* }

@count = global i32 0, align 4
@ss = common global %struct.s zeroinitializer, align 8
@p = common global %struct.s* null, align 8
@sss = common global [10 x %struct.s] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %pp = alloca %struct.s*, align 8
  %next = alloca %struct.s*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %1
  store %struct.s* @ss, %struct.s** @p, align 8
  %2 = load %struct.s** @p, align 8
  store %struct.s* %2, %struct.s** %next, align 8
  store i32 0, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %15, %0
  %4 = load i32* %i, align 4
  %5 = icmp slt i32 %4, 10
  br i1 %5, label %6, label %18

; <label>:6                                       ; preds = %3
  %7 = load i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [10 x %struct.s]* @sss, i32 0, i64 %8
  %10 = load %struct.s** %next, align 8
  %11 = getelementptr inbounds %struct.s* %10, i32 0, i32 0
  store %struct.s* %9, %struct.s** %11, align 8
  %12 = load %struct.s** %next, align 8
  %13 = getelementptr inbounds %struct.s* %12, i32 0, i32 0
  %14 = load %struct.s** %13, align 8
  store %struct.s* %14, %struct.s** %next, align 8
  br label %15

; <label>:15                                      ; preds = %6
  %16 = load i32* %i, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %i, align 4
  br label %3

; <label>:18                                      ; preds = %3
  %19 = load %struct.s** %next, align 8
  %20 = getelementptr inbounds %struct.s* %19, i32 0, i32 0
  store %struct.s* null, %struct.s** %20, align 8
  %21 = load %struct.s** @p, align 8
  call void @sub(%struct.s* %21, %struct.s** %pp)
  %22 = load i32* @count, align 4
  %23 = icmp ne i32 %22, 12
  br i1 %23, label %24, label %25

; <label>:24                                      ; preds = %18
  call void @abort() #2
  unreachable

; <label>:25                                      ; preds = %18
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %27 = load i32* %1
  ret i32 %27
}

; Function Attrs: nounwind uwtable
define void @sub(%struct.s* %p, %struct.s** %pp) #0 {
  %1 = alloca %struct.s*, align 8
  %2 = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %1, align 8
  store %struct.s** %pp, %struct.s*** %2, align 8
  br label %3

; <label>:3                                       ; preds = %16, %0
  %4 = load %struct.s** %1, align 8
  %5 = load %struct.s*** %2, align 8
  %6 = call i32 @look(%struct.s* %4, %struct.s** %5)
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %17

; <label>:8                                       ; preds = %3
  %9 = load %struct.s** %1, align 8
  %10 = icmp ne %struct.s* %9, null
  br i1 %10, label %11, label %15

; <label>:11                                      ; preds = %8
  %12 = load %struct.s** %1, align 8
  %13 = getelementptr inbounds %struct.s* %12, i32 0, i32 0
  %14 = load %struct.s** %13, align 8
  store %struct.s* %14, %struct.s** %1, align 8
  br label %16

; <label>:15                                      ; preds = %8
  br label %17

; <label>:16                                      ; preds = %11
  br label %3

; <label>:17                                      ; preds = %15, %3
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define i32 @look(%struct.s* %p, %struct.s** %pp) #0 {
  %1 = alloca %struct.s*, align 8
  %2 = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %1, align 8
  store %struct.s** %pp, %struct.s*** %2, align 8
  br label %3

; <label>:3                                       ; preds = %7, %0
  %4 = load %struct.s** %1, align 8
  %5 = icmp ne %struct.s* %4, null
  br i1 %5, label %6, label %11

; <label>:6                                       ; preds = %3
  br label %7

; <label>:7                                       ; preds = %6
  %8 = load %struct.s** %1, align 8
  %9 = getelementptr inbounds %struct.s* %8, i32 0, i32 0
  %10 = load %struct.s** %9, align 8
  store %struct.s* %10, %struct.s** %1, align 8
  br label %3

; <label>:11                                      ; preds = %3
  %12 = load %struct.s** %1, align 8
  %13 = load %struct.s*** %2, align 8
  store %struct.s* %12, %struct.s** %13, align 8
  %14 = load i32* @count, align 4
  %15 = add nsw i32 %14, 1
  store i32 %15, i32* @count, align 4
  ret i32 1
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"Ubuntu clang version 3.5-1ubuntu1 (trunk) (based on LLVM 3.5)"}
