; ModuleID = './j021.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.U0 = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @test1() #0 {
  %x = alloca i32, align 4
  br label %1

; <label>:1                                       ; preds = %0
  store i32 0, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  ret i32 %2
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %x = alloca i32, align 4
  %y = alloca float, align 4
  %p = alloca i32*, align 8
  %uc = alloca i8, align 1
  %u = alloca %union.U0, align 4
  store i32 0, i32* %1
  store i32 0, i32* %x, align 4
  %2 = load i32, i32* %x, align 4
  store float 0.000000e+00, float* %y, align 4
  %3 = load float, float* %y, align 4
  store i32* null, i32** %p, align 8
  %4 = load i32*, i32** %p, align 8
  %5 = load i8, i8* %uc, align 1
  %6 = bitcast %union.U0* %u to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 4, i32 4, i1 false)
  %7 = call i32 @test1()
  ret i32 %7
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
