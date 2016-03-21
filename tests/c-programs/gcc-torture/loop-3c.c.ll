; ModuleID = './loop-3c.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16

; Function Attrs: nounwind uwtable
define void @f(i32 %m) #0 {
  %1 = alloca i32, align 4
  %i = alloca i32, align 4
  %sh = alloca i32, align 4
  store i32 %m, i32* %1, align 4
  store i32 256, i32* %sh, align 4
  %2 = load i32, i32* %1, align 4
  store i32 %2, i32* %i, align 4
  br label %3

; <label>:3                                       ; preds = %14, %0
  %4 = load i32, i32* %i, align 4
  %5 = shl i32 %4, 3
  %6 = zext i32 %5 to i64
  %7 = getelementptr inbounds i8, i8* bitcast ([255 x i8*]* @a to i8*), i64 %6
  %8 = load i32, i32* %sh, align 4
  %9 = ashr i32 %8, 1
  store i32 %9, i32* %sh, align 4
  %10 = sext i32 %9 to i64
  %11 = getelementptr inbounds [255 x i8*], [255 x i8*]* @a, i32 0, i64 %10
  store i8* %7, i8** %11, align 8
  %12 = load i32, i32* %i, align 4
  %13 = add nsw i32 %12, 4
  store i32 %13, i32* %i, align 4
  br label %14

; <label>:14                                      ; preds = %3
  %15 = load i32, i32* %i, align 4
  %16 = icmp slt i32 %15, 1073741840
  br i1 %16, label %3, label %17

; <label>:17                                      ; preds = %14
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  store i8* null, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 8), align 8
  call void @f(i32 1610612736)
  %2 = load i8*, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 16), align 8
  %3 = icmp ne i8* %2, null
  br i1 %3, label %7, label %4

; <label>:4                                       ; preds = %0
  %5 = load i8*, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 8), align 8
  %6 = icmp ne i8* %5, null
  br i1 %6, label %7, label %8

; <label>:7                                       ; preds = %4, %0
  call void @abort() #2
  unreachable

; <label>:8                                       ; preds = %4
  store i8* null, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 16), align 8
  store i8* null, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 8), align 8
  call void @f(i32 1073741824)
  %9 = load i8*, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 16), align 8
  %10 = icmp ne i8* %9, null
  br i1 %10, label %11, label %14

; <label>:11                                      ; preds = %8
  %12 = load i8*, i8** getelementptr inbounds ([255 x i8*], [255 x i8*]* @a, i32 0, i64 8), align 8
  %13 = icmp ne i8* %12, null
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %11, %8
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %11
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %17 = load i32, i32* %1
  ret i32 %17
}

; Function Attrs: noreturn
declare void @abort() #1

; Function Attrs: noreturn
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
