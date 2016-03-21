; ModuleID = './c1x-6-5-2-5-15.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %p = alloca %struct.s*, align 8
  %q = alloca %struct.s*, align 8
  %j = alloca i32, align 4
  %2 = alloca %struct.s, align 4
  store i32 0, i32* %1
  store %struct.s* null, %struct.s** %p, align 8
  store i32 0, i32* %j, align 4
  br label %3

; <label>:3                                       ; preds = %10, %0
  %4 = load %struct.s*, %struct.s** %p, align 8
  store %struct.s* %4, %struct.s** %q, align 8
  %5 = getelementptr inbounds %struct.s, %struct.s* %2, i32 0, i32 0
  %6 = load i32, i32* %j, align 4
  %7 = add nsw i32 %6, 1
  store i32 %7, i32* %j, align 4
  store i32 %6, i32* %5, align 4
  store %struct.s* %2, %struct.s** %p, align 8
  %8 = load i32, i32* %j, align 4
  %9 = icmp slt i32 %8, 2
  br i1 %9, label %10, label %11

; <label>:10                                      ; preds = %3
  br label %3

; <label>:11                                      ; preds = %3
  %12 = load %struct.s*, %struct.s** %p, align 8
  %13 = load %struct.s*, %struct.s** %q, align 8
  %14 = icmp eq %struct.s* %12, %13
  br i1 %14, label %15, label %20

; <label>:15                                      ; preds = %11
  %16 = load %struct.s*, %struct.s** %q, align 8
  %17 = getelementptr inbounds %struct.s, %struct.s* %16, i32 0, i32 0
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 1
  br label %20

; <label>:20                                      ; preds = %15, %11
  %21 = phi i1 [ false, %11 ], [ %19, %15 ]
  %22 = zext i1 %21 to i32
  ret i32 %22
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
