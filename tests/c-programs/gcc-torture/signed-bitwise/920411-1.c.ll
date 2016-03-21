; ModuleID = './920411-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i64 @f(i8* %w) #0 {
  %1 = alloca i8*, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  %c = alloca i64, align 8
  %x = alloca i64, align 8
  %p = alloca i8*, align 8
  store i8* %w, i8** %1, align 8
  store i64 0, i64* %c, align 8
  %2 = bitcast i64* %x to i8*
  store i8* %2, i8** %p, align 8
  store i64 0, i64* %i, align 8
  br label %3

; <label>:3                                       ; preds = %25, %0
  %4 = load i64, i64* %i, align 8
  %5 = icmp slt i64 %4, 1
  br i1 %5, label %6, label %28

; <label>:6                                       ; preds = %3
  store i64 0, i64* %k, align 8
  br label %7

; <label>:7                                       ; preds = %18, %6
  %8 = load i64, i64* %k, align 8
  %9 = icmp ult i64 %8, 8
  br i1 %9, label %10, label %21

; <label>:10                                      ; preds = %7
  %11 = load i64, i64* %k, align 8
  %12 = load i8*, i8** %1, align 8
  %13 = getelementptr inbounds i8, i8* %12, i64 %11
  %14 = load i8, i8* %13, align 1
  %15 = load i64, i64* %k, align 8
  %16 = load i8*, i8** %p, align 8
  %17 = getelementptr inbounds i8, i8* %16, i64 %15
  store i8 %14, i8* %17, align 1
  br label %18

; <label>:18                                      ; preds = %10
  %19 = load i64, i64* %k, align 8
  %20 = add nsw i64 %19, 1
  store i64 %20, i64* %k, align 8
  br label %7

; <label>:21                                      ; preds = %7
  %22 = load i64, i64* %x, align 8
  %23 = load i64, i64* %c, align 8
  %24 = add nsw i64 %23, %22
  store i64 %24, i64* %c, align 8
  br label %25

; <label>:25                                      ; preds = %21
  %26 = load i64, i64* %i, align 8
  %27 = add nsw i64 %26, 1
  store i64 %27, i64* %i, align 8
  br label %3

; <label>:28                                      ; preds = %3
  %29 = load i64, i64* %c, align 8
  ret i64 %29
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [8 x i8], align 1
  store i32 0, i32* %1
  store i32 8, i32* %i, align 4
  br label %2

; <label>:2                                       ; preds = %6, %0
  %3 = load i32, i32* %i, align 4
  %4 = add nsw i32 %3, -1
  store i32 %4, i32* %i, align 4
  %5 = icmp sge i32 %4, 0
  br i1 %5, label %6, label %10

; <label>:6                                       ; preds = %2
  %7 = load i32, i32* %i, align 4
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds [8 x i8], [8 x i8]* %a, i32 0, i64 %8
  store i8 32, i8* %9, align 1
  br label %2

; <label>:10                                      ; preds = %2
  %11 = getelementptr inbounds [8 x i8], [8 x i8]* %a, i32 0, i32 0
  %12 = call i64 @f(i8* %11)
  %13 = icmp ne i64 %12, 2314885530818453536
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %10
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %10
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %17 = load i32, i32* %1
  ret i32 %17
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
