; ModuleID = './pr29156.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.test1 = type { i32, i32 }
%struct.test2 = type { float, %struct.test1 }

@global = common global i32 0, align 4

; Function Attrs: nounwind uwtable
define i32 @bla(%struct.test1* %xa, %struct.test2* %xb) #0 {
  %1 = alloca %struct.test1*, align 8
  %2 = alloca %struct.test2*, align 8
  store %struct.test1* %xa, %struct.test1** %1, align 8
  store %struct.test2* %xb, %struct.test2** %2, align 8
  store i32 1, i32* @global, align 4
  %3 = load %struct.test2*, %struct.test2** %2, align 8
  %4 = getelementptr inbounds %struct.test2, %struct.test2* %3, i32 0, i32 1
  %5 = getelementptr inbounds %struct.test1, %struct.test1* %4, i32 0, i32 0
  store i32 1, i32* %5, align 4
  %6 = load %struct.test1*, %struct.test1** %1, align 8
  %7 = getelementptr inbounds %struct.test1, %struct.test1* %6, i32 0, i32 0
  store i32 8, i32* %7, align 4
  %8 = load %struct.test2*, %struct.test2** %2, align 8
  %9 = getelementptr inbounds %struct.test2, %struct.test2* %8, i32 0, i32 1
  %10 = getelementptr inbounds %struct.test1, %struct.test1* %9, i32 0, i32 0
  %11 = load i32, i32* %10, align 4
  ret i32 %11
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %pom = alloca %struct.test2, align 4
  store i32 0, i32* %1
  %2 = getelementptr inbounds %struct.test2, %struct.test2* %pom, i32 0, i32 1
  %3 = call i32 @bla(%struct.test1* %2, %struct.test2* %pom)
  %4 = icmp ne i32 %3, 8
  br i1 %4, label %5, label %6

; <label>:5                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:6                                       ; preds = %0
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
