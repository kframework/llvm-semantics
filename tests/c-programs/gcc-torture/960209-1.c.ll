; ModuleID = './960209-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.a_struct = type { i8 }

@yabba = global i32 1, align 4
@an_array = common global [5 x %struct.a_struct] zeroinitializer, align 1
@a_ptr = common global %struct.a_struct* null, align 8

; Function Attrs: nounwind uwtable
define i32 @f(i32, i64 %b) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i8, align 1
  %4 = alloca i64, align 8
  %i = alloca i64, align 8
  %j = alloca i64, align 8
  %p = alloca i64, align 8
  %q = alloca i64, align 8
  %r = alloca i64, align 8
  %s = alloca i64, align 8
  %a = trunc i32 %0 to i8
  store i8 %a, i8* %3, align 1
  store i64 %b, i64* %4, align 8
  %5 = load i64, i64* %4, align 8
  %6 = icmp ne i64 %5, 0
  br i1 %6, label %7, label %55

; <label>:7                                       ; preds = %1
  %8 = load i32, i32* @yabba, align 4
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %7
  store i32 -1, i32* %2
  br label %67

; <label>:11                                      ; preds = %7
  %12 = load i64, i64* %4, align 8
  %13 = udiv i64 4000000, %12
  store i64 %13, i64* %s, align 8
  store i64 0, i64* %i, align 8
  br label %14

; <label>:14                                      ; preds = %51, %11
  %15 = load i64, i64* %i, align 8
  %16 = icmp slt i64 %15, 11
  br i1 %16, label %17, label %54

; <label>:17                                      ; preds = %14
  store i64 0, i64* %j, align 8
  br label %18

; <label>:18                                      ; preds = %47, %17
  %19 = load i64, i64* %j, align 8
  %20 = icmp slt i64 %19, 256
  br i1 %20, label %21, label %50

; <label>:21                                      ; preds = %18
  %22 = load i64, i64* %p, align 8
  %23 = load i64, i64* %s, align 8
  %24 = sub nsw i64 %22, %23
  %25 = icmp slt i64 %24, 0
  br i1 %25, label %26, label %29

; <label>:26                                      ; preds = %21
  %27 = load i64, i64* %s, align 8
  %28 = sub nsw i64 0, %27
  br label %30

; <label>:29                                      ; preds = %21
  br label %30

; <label>:30                                      ; preds = %29, %26
  %31 = phi i64 [ %28, %26 ], [ 0, %29 ]
  %32 = load i64, i64* %q, align 8
  %33 = load i64, i64* %s, align 8
  %34 = sub nsw i64 %32, %33
  %35 = icmp slt i64 %34, 0
  br i1 %35, label %36, label %39

; <label>:36                                      ; preds = %30
  %37 = load i64, i64* %s, align 8
  %38 = sub nsw i64 0, %37
  br label %41

; <label>:39                                      ; preds = %30
  %40 = load i64, i64* %q, align 8
  br label %41

; <label>:41                                      ; preds = %39, %36
  %42 = phi i64 [ %38, %36 ], [ %40, %39 ]
  %43 = icmp slt i64 %31, %42
  br i1 %43, label %44, label %46

; <label>:44                                      ; preds = %41
  %45 = load i64, i64* %i, align 8
  store i64 %45, i64* %r, align 8
  br label %46

; <label>:46                                      ; preds = %44, %41
  br label %47

; <label>:47                                      ; preds = %46
  %48 = load i64, i64* %j, align 8
  %49 = add nsw i64 %48, 1
  store i64 %49, i64* %j, align 8
  br label %18

; <label>:50                                      ; preds = %18
  br label %51

; <label>:51                                      ; preds = %50
  %52 = load i64, i64* %i, align 8
  %53 = add nsw i64 %52, 1
  store i64 %53, i64* %i, align 8
  br label %14

; <label>:54                                      ; preds = %14
  br label %55

; <label>:55                                      ; preds = %54, %1
  %56 = load i32, i32* @yabba, align 4
  %57 = icmp ne i32 %56, 0
  br i1 %57, label %58, label %59

; <label>:58                                      ; preds = %55
  store i32 0, i32* %2
  br label %67

; <label>:59                                      ; preds = %55
  %60 = load i8, i8* %3, align 1
  %61 = zext i8 %60 to i64
  %62 = getelementptr inbounds [5 x %struct.a_struct], [5 x %struct.a_struct]* @an_array, i32 0, i64 %61
  store %struct.a_struct* %62, %struct.a_struct** @a_ptr, align 8
  %63 = load i64, i64* %r, align 8
  %64 = trunc i64 %63 to i8
  %65 = load %struct.a_struct*, %struct.a_struct** @a_ptr, align 8
  %66 = getelementptr inbounds %struct.a_struct, %struct.a_struct* %65, i32 0, i32 0
  store i8 %64, i8* %66, align 1
  store i32 0, i32* %2
  br label %67

; <label>:67                                      ; preds = %59, %58, %10
  %68 = load i32, i32* %2
  ret i32 %68
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f(i32 1, i64 0)
  %3 = icmp ne i32 %2, 0
  br i1 %3, label %4, label %5

; <label>:4                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:5                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %7 = load i32, i32* %1
  ret i32 %7
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
