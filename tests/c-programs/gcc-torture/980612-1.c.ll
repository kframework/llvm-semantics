; ModuleID = './980612-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.fd = type { i8, i8 }

@f = global %struct.fd { i8 5, i8 0 }, align 1

; Function Attrs: nounwind uwtable
define %struct.fd* @g() #0 {
  ret %struct.fd* @f
}

; Function Attrs: nounwind uwtable
define i32 @h() #0 {
  ret i32 -1
}

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  %f = alloca %struct.fd*, align 8
  store i32 0, i32* %1
  %2 = call %struct.fd* @g()
  store %struct.fd* %2, %struct.fd** %f, align 8
  %3 = call i32 @h()
  %4 = trunc i32 %3 to i8
  %5 = load %struct.fd*, %struct.fd** %f, align 8
  %6 = getelementptr inbounds %struct.fd, %struct.fd* %5, i32 0, i32 1
  store i8 %4, i8* %6, align 1
  %7 = load %struct.fd*, %struct.fd** %f, align 8
  %8 = getelementptr inbounds %struct.fd, %struct.fd* %7, i32 0, i32 0
  %9 = load i8, i8* %8, align 1
  %10 = zext i8 %9 to i32
  %11 = and i32 %10, 127
  %12 = and i32 %11, -17
  %13 = icmp sle i32 %12, 2
  br i1 %13, label %14, label %15

; <label>:14                                      ; preds = %0
  call void @abort() #2
  unreachable

; <label>:15                                      ; preds = %0
  call void @exit(i32 0) #2
  unreachable
                                                  ; No predecessors!
  %17 = load i32, i32* %1
  ret i32 %17
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
