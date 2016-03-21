; ModuleID = './ipa-sra-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.bovid = type { float, i32, i8* }

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  %r = alloca i32, align 4
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32, i32* %2, align 4
  %5 = icmp sgt i32 %4, 2000
  %6 = zext i1 %5 to i32
  %7 = call i32 @ox(i32 %6, %struct.bovid* null)
  store i32 %7, i32* %r, align 4
  %8 = load i32, i32* %r, align 4
  ret i32 %8
}

; Function Attrs: noinline nounwind uwtable
define internal i32 @ox(i32 %fail, %struct.bovid* %cow) #1 {
  %1 = alloca i32, align 4
  %2 = alloca %struct.bovid*, align 8
  %r = alloca i32, align 4
  store i32 %fail, i32* %1, align 4
  store %struct.bovid* %cow, %struct.bovid** %2, align 8
  %3 = load i32, i32* %1, align 4
  %4 = icmp ne i32 %3, 0
  br i1 %4, label %5, label %10

; <label>:5                                       ; preds = %0
  %6 = load %struct.bovid*, %struct.bovid** %2, align 8
  %7 = getelementptr inbounds %struct.bovid, %struct.bovid* %6, i32 0, i32 0
  %8 = load float, float* %7, align 4
  %9 = fptosi float %8 to i32
  store i32 %9, i32* %r, align 4
  br label %11

; <label>:10                                      ; preds = %0
  store i32 0, i32* %r, align 4
  br label %11

; <label>:11                                      ; preds = %10, %5
  %12 = load i32, i32* %r, align 4
  ret i32 %12
}

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
