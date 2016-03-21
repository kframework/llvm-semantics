; ModuleID = './20000722-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.s = type { i8*, i32 }

@.str = private unnamed_addr constant [3 x i8] c"hi\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @bar()
  call void @bar()
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %3 = load i32, i32* %1
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define void @bar() #0 {
  %1 = alloca %struct.s, align 8
  %2 = getelementptr inbounds %struct.s, %struct.s* %1, i32 0, i32 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str, i32 0, i32 0), i8** %2, align 8
  %3 = getelementptr inbounds %struct.s, %struct.s* %1, i32 0, i32 1
  store i32 1, i32* %3, align 4
  call void @foo(%struct.s* %1)
  ret void
}

; Function Attrs: noreturn nounwind
declare void @exit(i32) #1

; Function Attrs: nounwind uwtable
define void @foo(%struct.s* %p) #0 {
  %1 = alloca %struct.s*, align 8
  store %struct.s* %p, %struct.s** %1, align 8
  %2 = load %struct.s*, %struct.s** %1, align 8
  %3 = getelementptr inbounds %struct.s, %struct.s* %2, i32 0, i32 1
  %4 = load i32, i32* %3, align 4
  %5 = icmp ne i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @abort() #2
  unreachable

; <label>:7                                       ; preds = %0
  %8 = load %struct.s*, %struct.s** %1, align 8
  %9 = getelementptr inbounds %struct.s, %struct.s* %8, i32 0, i32 1
  store i32 2, i32* %9, align 4
  ret void
}

; Function Attrs: noreturn nounwind
declare void @abort() #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
