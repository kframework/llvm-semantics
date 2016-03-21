; ModuleID = './950607-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.anon = type { i64 }

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %h = alloca %struct.anon, align 8
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.anon, %struct.anon* %h, i32 0, i32 0
  store i64 0, i64* %2, align 8
  %3 = getelementptr inbounds %struct.anon, %struct.anon* %h, i32 0, i32 0
  %4 = load i64, i64* %3, align 8
  %5 = and i64 %4, 128
  %6 = icmp eq i64 %5, 1
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %0
  %8 = getelementptr inbounds %struct.anon, %struct.anon* %h, i32 0, i32 0
  %9 = load i64, i64* %8, align 8
  %10 = and i64 %9, 32
  %11 = icmp eq i64 %10, 0
  br i1 %11, label %12, label %13

; <label>:12                                      ; preds = %7
  call void @abort() #2
  unreachable

; <label>:13                                      ; preds = %7, %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %15 = load i32, i32* %1
  ret i32 %15
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
