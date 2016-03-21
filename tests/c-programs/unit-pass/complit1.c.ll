; ModuleID = './complit1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i32 }

@f.x = internal global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @f() #0 {
  %a = alloca %struct.s*, align 8
  %1 = alloca %struct.s, align 4
  %2 = load i32, i32* @f.x, align 4
  %3 = add nsw i32 %2, 1
  store i32 %3, i32* @f.x, align 4
  %4 = getelementptr inbounds %struct.s, %struct.s* %1, i32 0, i32 0
  %5 = load i32, i32* @f.x, align 4
  store i32 %5, i32* %4, align 4
  store %struct.s* %1, %struct.s** %a, align 8
  %6 = load i32, i32* @f.x, align 4
  %7 = icmp slt i32 %6, 2
  br i1 %7, label %8, label %10

; <label>:8                                       ; preds = %0
  %9 = call i32 @f()
  br label %10

; <label>:10                                      ; preds = %8, %0
  %11 = load %struct.s*, %struct.s** %a, align 8
  %12 = getelementptr inbounds %struct.s, %struct.s* %11, i32 0, i32 0
  %13 = load i32, i32* %12, align 4
  ret i32 %13
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
