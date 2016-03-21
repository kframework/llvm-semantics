; ModuleID = './20040331-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %s = alloca %struct.anon, align 4
  store i32 0, i32* %1
  %2 = bitcast %struct.anon* %s to i8*
  call void @llvm.memset.p0i8.i64(i8* %2, i8 0, i64 4, i32 4, i1 false)
  br label %3

; <label>:3                                       ; preds = %0
  %4 = bitcast %struct.anon* %s to i32*
  %5 = load i32, i32* %4, align 4
  %6 = shl i32 %5, 1
  %7 = ashr i32 %6, 1
  %8 = add nsw i32 %7, -1
  %9 = load i32, i32* %4, align 4
  %10 = and i32 %8, 2147483647
  %11 = and i32 %9, -2147483648
  %12 = or i32 %11, %10
  store i32 %12, i32* %4, align 4
  %13 = shl i32 %10, 1
  %14 = ashr i32 %13, 1
  %15 = icmp ne i32 %7, 0
  br i1 %15, label %16, label %17

; <label>:16                                      ; preds = %3
  call void @abort() #3
  unreachable

; <label>:17                                      ; preds = %3
  call void @exit(i32 0) #3
  unreachable
                                                  ; No predecessors!
  %19 = load i32, i32* %1
  ret i32 %19
}

; Function Attrs: nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) #1

; Function Attrs: noreturn
declare void @abort() #2

; Function Attrs: noreturn
declare void @exit(i32) #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
