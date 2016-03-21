; ModuleID = './20010224-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@masktab = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2
@psd = global [6 x i16] [i16 50, i16 40, i16 30, i16 20, i16 10, i16 0], align 2
@bndpsd = global [6 x i16] [i16 1, i16 2, i16 3, i16 4, i16 5, i16 0], align 2

; Function Attrs: nounwind uwtable
define void @ba_compute_psd(i16 signext %start) #0 {
  %1 = alloca i16, align 2
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %k = alloca i32, align 4
  %lastbin = alloca i16, align 2
  store i16 %start, i16* %1, align 2
  store i16 4, i16* %lastbin, align 2
  %2 = load i16, i16* %1, align 2
  %3 = sext i16 %2 to i32
  store i32 %3, i32* %j, align 4
  %4 = load i16, i16* %1, align 2
  %5 = sext i16 %4 to i64
  %6 = getelementptr inbounds [6 x i16], [6 x i16]* @masktab, i32 0, i64 %5
  %7 = load i16, i16* %6, align 2
  %8 = sext i16 %7 to i32
  store i32 %8, i32* %k, align 4
  %9 = load i32, i32* %j, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [6 x i16], [6 x i16]* @psd, i32 0, i64 %10
  %12 = load i16, i16* %11, align 2
  %13 = load i32, i32* %k, align 4
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds [6 x i16], [6 x i16]* @bndpsd, i32 0, i64 %14
  store i16 %12, i16* %15, align 2
  %16 = load i32, i32* %j, align 4
  %17 = add nsw i32 %16, 1
  store i32 %17, i32* %j, align 4
  %18 = load i32, i32* %j, align 4
  store i32 %18, i32* %i, align 4
  br label %19

; <label>:19                                      ; preds = %37, %0
  %20 = load i32, i32* %i, align 4
  %21 = load i16, i16* %lastbin, align 2
  %22 = sext i16 %21 to i32
  %23 = icmp slt i32 %20, %22
  br i1 %23, label %24, label %40

; <label>:24                                      ; preds = %19
  %25 = load i32, i32* %k, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds [6 x i16], [6 x i16]* @bndpsd, i32 0, i64 %26
  %28 = load i32, i32* %j, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [6 x i16], [6 x i16]* @psd, i32 0, i64 %29
  %31 = call signext i16 @logadd(i16* %27, i16* %30)
  %32 = load i32, i32* %k, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [6 x i16], [6 x i16]* @bndpsd, i32 0, i64 %33
  store i16 %31, i16* %34, align 2
  %35 = load i32, i32* %j, align 4
  %36 = add nsw i32 %35, 1
  store i32 %36, i32* %j, align 4
  br label %37

; <label>:37                                      ; preds = %24
  %38 = load i32, i32* %i, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %i, align 4
  br label %19

; <label>:40                                      ; preds = %19
  ret void
}

; Function Attrs: nounwind uwtable
define signext i16 @logadd(i16* %a, i16* %b) #0 {
  %1 = alloca i16*, align 8
  %2 = alloca i16*, align 8
  store i16* %a, i16** %1, align 8
  store i16* %b, i16** %2, align 8
  %3 = load i16*, i16** %1, align 8
  %4 = load i16, i16* %3, align 2
  %5 = sext i16 %4 to i32
  %6 = load i16*, i16** %2, align 8
  %7 = load i16, i16* %6, align 2
  %8 = sext i16 %7 to i32
  %9 = add nsw i32 %5, %8
  %10 = trunc i32 %9 to i16
  ret i16 %10
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  store i32 0, i32* %1
  call void @ba_compute_psd(i16 signext 0)
  %2 = load i16, i16* getelementptr inbounds ([6 x i16], [6 x i16]* @bndpsd, i32 0, i64 1), align 2
  %3 = sext i16 %2 to i32
  %4 = icmp ne i32 %3, 140
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
