; ModuleID = './complit2.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %p = alloca %struct.s*, align 8
  %q = alloca %struct.s*, align 8
  %j = alloca i32, align 4
  %1 = alloca %struct.s, align 4
  store %struct.s* null, %struct.s** %p, align 8
  store i32 0, i32* %j, align 4
  br label %2

; <label>:2                                       ; preds = %9, %0
  %3 = load %struct.s*, %struct.s** %p, align 8
  store %struct.s* %3, %struct.s** %q, align 8
  %4 = getelementptr inbounds %struct.s, %struct.s* %1, i32 0, i32 0
  %5 = load i32, i32* %j, align 4
  %6 = add nsw i32 %5, 1
  store i32 %6, i32* %j, align 4
  store i32 %5, i32* %4, align 4
  store %struct.s* %1, %struct.s** %p, align 8
  %7 = load i32, i32* %j, align 4
  %8 = icmp slt i32 %7, 2
  br i1 %8, label %9, label %10

; <label>:9                                       ; preds = %2
  br label %2

; <label>:10                                      ; preds = %2
  %11 = load %struct.s*, %struct.s** %p, align 8
  %12 = load %struct.s*, %struct.s** %q, align 8
  %13 = icmp eq %struct.s* %11, %12
  br i1 %13, label %14, label %19

; <label>:14                                      ; preds = %10
  %15 = load %struct.s*, %struct.s** %q, align 8
  %16 = getelementptr inbounds %struct.s, %struct.s* %15, i32 0, i32 0
  %17 = load i32, i32* %16, align 4
  %18 = icmp eq i32 %17, 1
  br label %19

; <label>:19                                      ; preds = %14, %10
  %20 = phi i1 [ false, %10 ], [ %18, %14 ]
  %21 = zext i1 %20 to i32
  ret i32 %21
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @f()
  %3 = icmp ne i32 %2, 1
  %4 = zext i1 %3 to i32
  ret i32 %4
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
