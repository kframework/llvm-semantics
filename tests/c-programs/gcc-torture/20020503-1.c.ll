; ModuleID = './20020503-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %buf = alloca [128 x i8], align 16
  %p = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds [128 x i8], [128 x i8]* %buf, i32 0, i32 0
  %3 = call i8* @inttostr(i64 -1, i8* %2)
  store i8* %3, i8** %p, align 8
  %4 = load i8*, i8** %p, align 8
  %5 = load i8, i8* %4, align 1
  %6 = sext i8 %5 to i32
  %7 = icmp ne i32 %6, 45
  br i1 %7, label %8, label %9

; <label>:8                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:9                                       ; preds = %0
  ret i32 0
}

; Function Attrs: nounwind uwtable
define internal i8* @inttostr(i64 %i, i8* %buf) #0 {
  %1 = alloca i64, align 8
  %2 = alloca i8*, align 8
  %ui = alloca i64, align 8
  %p = alloca i8*, align 8
  store i64 %i, i64* %1, align 8
  store i8* %buf, i8** %2, align 8
  %3 = load i64, i64* %1, align 8
  store i64 %3, i64* %ui, align 8
  %4 = load i8*, i8** %2, align 8
  %5 = getelementptr inbounds i8, i8* %4, i64 127
  store i8* %5, i8** %p, align 8
  %6 = load i8*, i8** %p, align 8
  store i8 0, i8* %6, align 1
  %7 = load i64, i64* %1, align 8
  %8 = icmp slt i64 %7, 0
  br i1 %8, label %9, label %12

; <label>:9                                       ; preds = %0
  %10 = load i64, i64* %ui, align 8
  %11 = sub i64 0, %10
  store i64 %11, i64* %ui, align 8
  br label %12

; <label>:12                                      ; preds = %9, %0
  br label %13

; <label>:13                                      ; preds = %20, %12
  %14 = load i64, i64* %ui, align 8
  %15 = urem i64 %14, 10
  %16 = add i64 48, %15
  %17 = trunc i64 %16 to i8
  %18 = load i8*, i8** %p, align 8
  %19 = getelementptr inbounds i8, i8* %18, i32 -1
  store i8* %19, i8** %p, align 8
  store i8 %17, i8* %19, align 1
  br label %20

; <label>:20                                      ; preds = %13
  %21 = load i64, i64* %ui, align 8
  %22 = udiv i64 %21, 10
  store i64 %22, i64* %ui, align 8
  %23 = icmp ne i64 %22, 0
  br i1 %23, label %13, label %24

; <label>:24                                      ; preds = %20
  %25 = load i64, i64* %1, align 8
  %26 = icmp slt i64 %25, 0
  br i1 %26, label %27, label %30

; <label>:27                                      ; preds = %24
  %28 = load i8*, i8** %p, align 8
  %29 = getelementptr inbounds i8, i8* %28, i32 -1
  store i8* %29, i8** %p, align 8
  store i8 45, i8* %29, align 1
  br label %30

; <label>:30                                      ; preds = %27, %24
  %31 = load i8*, i8** %p, align 8
  ret i8* %31
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
