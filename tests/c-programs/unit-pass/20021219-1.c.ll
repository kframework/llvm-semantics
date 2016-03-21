; ModuleID = './20021219-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

@main.str = private unnamed_addr constant [11 x i8] c"foo { xx }\00", align 1

; Function Attrs: nounwind uwtable
define void @foo(i8* %p1, i8** %p2) #0 {
  %1 = alloca i8*, align 8
  %2 = alloca i8**, align 8
  store i8* %p1, i8** %1, align 8
  store i8** %p2, i8*** %2, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %str = alloca [11 x i8], align 1
  %ptr = alloca i8*, align 8
  store i32 0, i32* %1
  %2 = bitcast [11 x i8]* %str to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* getelementptr inbounds ([11 x i8], [11 x i8]* @main.str, i32 0, i32 0), i64 11, i32 1, i1 false)
  %3 = getelementptr inbounds [11 x i8], [11 x i8]* %str, i32 0, i32 0
  %4 = getelementptr inbounds i8, i8* %3, i64 5
  store i8* %4, i8** %ptr, align 8
  %5 = load i8*, i8** %ptr, align 8
  call void @foo(i8* %5, i8** %ptr)
  br label %6

; <label>:6                                       ; preds = %25, %0
  %7 = load i8*, i8** %ptr, align 8
  %8 = load i8, i8* %7, align 1
  %9 = sext i8 %8 to i32
  %10 = icmp ne i32 %9, 0
  br i1 %10, label %11, label %23

; <label>:11                                      ; preds = %6
  %12 = load i8*, i8** %ptr, align 8
  %13 = load i8, i8* %12, align 1
  %14 = sext i8 %13 to i32
  %15 = icmp eq i32 %14, 13
  br i1 %15, label %21, label %16

; <label>:16                                      ; preds = %11
  %17 = load i8*, i8** %ptr, align 8
  %18 = load i8, i8* %17, align 1
  %19 = sext i8 %18 to i32
  %20 = icmp eq i32 %19, 32
  br label %21

; <label>:21                                      ; preds = %16, %11
  %22 = phi i1 [ true, %11 ], [ %20, %16 ]
  br label %23

; <label>:23                                      ; preds = %21, %6
  %24 = phi i1 [ false, %6 ], [ %22, %21 ]
  br i1 %24, label %25, label %28

; <label>:25                                      ; preds = %23
  %26 = load i8*, i8** %ptr, align 8
  %27 = getelementptr inbounds i8, i8* %26, i32 1
  store i8* %27, i8** %ptr, align 8
  br label %6

; <label>:28                                      ; preds = %23
  ret i32 0
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
