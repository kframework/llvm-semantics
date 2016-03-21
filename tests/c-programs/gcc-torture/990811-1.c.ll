; ModuleID = './990811-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i64, i32 }

; Function Attrs: nounwind uwtable
define i32 @foo(i32 %x, i8* %y) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8*, align 8
  store i32 %x, i32* %2, align 4
  store i8* %y, i8** %3, align 8
  %4 = load i32, i32* %2, align 4
  switch i32 %4, label %20 [
    i32 0, label %5
    i32 1, label %11
    i32 2, label %15
  ]

; <label>:5                                       ; preds = %0
  %6 = load i8*, i8** %3, align 8
  %7 = bitcast i8* %6 to %struct.s*
  %8 = getelementptr inbounds %struct.s, %struct.s* %7, i32 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = trunc i64 %9 to i32
  store i32 %10, i32* %1
  br label %21

; <label>:11                                      ; preds = %0
  %12 = load i8*, i8** %3, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  store i32 %14, i32* %1
  br label %21

; <label>:15                                      ; preds = %0
  %16 = load i8*, i8** %3, align 8
  %17 = bitcast i8* %16 to i16*
  %18 = load i16, i16* %17, align 2
  %19 = sext i16 %18 to i32
  store i32 %19, i32* %1
  br label %21

; <label>:20                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:21                                      ; preds = %15, %11, %5
  %22 = load i32, i32* %1
  ret i32 %22
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.s, align 8
  %sh = alloca [10 x i16], align 16
  %c = alloca [10 x i8], align 1
  %i = alloca i32, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.s, %struct.s* %s, i32 0, i32 0
  store i64 1, i64* %2, align 8
  %3 = getelementptr inbounds %struct.s, %struct.s* %s, i32 0, i32 1
  store i32 2, i32* %3, align 4
  store i32 0, i32* %i, align 4
  br label %4

; <label>:4                                       ; preds = %18, %0
  %5 = load i32, i32* %i, align 4
  %6 = icmp slt i32 %5, 10
  br i1 %6, label %7, label %21

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* %i, align 4
  %9 = trunc i32 %8 to i16
  %10 = load i32, i32* %i, align 4
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds [10 x i16], [10 x i16]* %sh, i32 0, i64 %11
  store i16 %9, i16* %12, align 2
  %13 = load i32, i32* %i, align 4
  %14 = trunc i32 %13 to i8
  %15 = load i32, i32* %i, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds [10 x i8], [10 x i8]* %c, i32 0, i64 %16
  store i8 %14, i8* %17, align 1
  br label %18

; <label>:18                                      ; preds = %7
  %19 = load i32, i32* %i, align 4
  %20 = add nsw i32 %19, 1
  store i32 %20, i32* %i, align 4
  br label %4

; <label>:21                                      ; preds = %4
  %22 = bitcast %struct.s* %s to i8*
  %23 = call i32 @foo(i32 0, i8* %22)
  %24 = icmp ne i32 %23, 1
  br i1 %24, label %25, label %26

; <label>:25                                      ; preds = %21
  call void @abort() #2
  unreachable

; <label>:26                                      ; preds = %21
  %27 = getelementptr inbounds [10 x i8], [10 x i8]* %c, i32 0, i32 0
  %28 = getelementptr inbounds i8, i8* %27, i64 3
  %29 = call i32 @foo(i32 1, i8* %28)
  %30 = icmp ne i32 %29, 3
  br i1 %30, label %31, label %32

; <label>:31                                      ; preds = %26
  call void @abort() #2
  unreachable

; <label>:32                                      ; preds = %26
  %33 = getelementptr inbounds [10 x i16], [10 x i16]* %sh, i32 0, i32 0
  %34 = getelementptr inbounds i16, i16* %33, i64 3
  %35 = bitcast i16* %34 to i8*
  %36 = call i32 @foo(i32 2, i8* %35)
  %37 = icmp ne i32 %36, 3
  br i1 %37, label %38, label %39

; <label>:38                                      ; preds = %32
  call void @abort() #2
  unreachable

; <label>:39                                      ; preds = %32
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %41 = load i32, i32* %1
  ret i32 %41
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
