; ModuleID = './20001228-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%union.anon = type { i32 }
%union.anon.0 = type { i32 }

; Function Attrs: nounwind uwtable
define i32 @foo1() #0 {
  %u = alloca %union.anon, align 4
  %1 = bitcast %union.anon* %u to i32*
  store i32 1, i32* %1, align 4
  %2 = bitcast %union.anon* %u to [4 x i8]*
  %3 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i32 0, i64 0
  %4 = load i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @foo2() #0 {
  %u = alloca %union.anon.0, align 4
  %1 = bitcast %union.anon.0* %u to i32*
  store volatile i32 1, i32* %1, align 4
  %2 = bitcast %union.anon.0* %u to [4 x i8]*
  %3 = getelementptr inbounds [4 x i8], [4 x i8]* %2, i32 0, i64 0
  %4 = load volatile i8, i8* %3, align 1
  %5 = sext i8 %4 to i32
  ret i32 %5
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  %2 = call i32 @foo1()
  %3 = call i32 @foo2()
  %4 = icmp ne i32 %2, %3
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %8 = load i32, i32* %1
  ret i32 %8
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
