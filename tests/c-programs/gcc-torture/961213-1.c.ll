; ModuleID = './961213-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.ar = private unnamed_addr constant [5 x i32] [i32 10, i32 11, i32 12, i32 13, i32 14], align 16

; Function Attrs: nounwind uwtable
define i32 @g(i64* %v, i32 %n, i32* %a, i32 %b) #0 {
  %1 = alloca i64*, align 8
  %2 = alloca i32, align 4
  %3 = alloca i32*, align 8
  %4 = alloca i32, align 4
  %cnt = alloca i32, align 4
  store i64* %v, i64** %1, align 8
  store i32 %n, i32* %2, align 4
  store i32* %a, i32** %3, align 8
  store i32 %b, i32* %4, align 4
  %5 = load i64*, i64** %1, align 8
  store i64 0, i64* %5, align 8
  store i32 0, i32* %cnt, align 4
  br label %6

; <label>:6                                       ; preds = %24, %0
  %7 = load i32, i32* %cnt, align 4
  %8 = load i32, i32* %2, align 4
  %9 = icmp slt i32 %7, %8
  br i1 %9, label %10, label %27

; <label>:10                                      ; preds = %6
  %11 = load i64*, i64** %1, align 8
  %12 = load i64, i64* %11, align 8
  %13 = load i32, i32* %4, align 4
  %14 = sext i32 %13 to i64
  %15 = mul i64 %12, %14
  %16 = load i32, i32* %cnt, align 4
  %17 = sext i32 %16 to i64
  %18 = load i32*, i32** %3, align 8
  %19 = getelementptr inbounds i32, i32* %18, i64 %17
  %20 = load i32, i32* %19, align 4
  %21 = zext i32 %20 to i64
  %22 = add i64 %15, %21
  %23 = load i64*, i64** %1, align 8
  store i64 %22, i64* %23, align 8
  br label %24

; <label>:24                                      ; preds = %10
  %25 = load i32, i32* %cnt, align 4
  %26 = add nsw i32 %25, 1
  store i32 %26, i32* %cnt, align 4
  br label %6

; <label>:27                                      ; preds = %6
  %28 = load i32, i32* %2, align 4
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %res = alloca i32, align 4
  %ar = alloca [5 x i32], align 16
  %v = alloca i64, align 8
  store i32 0, i32* %1
  %2 = bitcast [5 x i32]* %ar to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* bitcast ([5 x i32]* @main.ar to i8*), i64 20, i32 16, i1 false)
  %3 = getelementptr inbounds [5 x i32], [5 x i32]* %ar, i32 0, i32 0
  %4 = call i32 @g(i64* %v, i32 5, i32* %3, i32 16)
  store i32 %4, i32* %res, align 4
  %5 = load i64, i64* %v, align 8
  %6 = icmp ne i64 %5, 703710
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %0
  call void @abort() #3
  unreachable

; <label>:8                                       ; preds = %0
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %10 = load i32, i32* %1
  ret i32 %10
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noreturn nounwind
declare void @abort() #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
