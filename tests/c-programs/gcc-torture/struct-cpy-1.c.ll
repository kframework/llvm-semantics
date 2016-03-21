; ModuleID = './struct-cpy-1.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-linux-gnu"

%struct.tty_driver = type { [38 x i8], %struct.termios, [4 x i8] }
%struct.termios = type { i32, i32, i32, i32, [28 x i8] }

@pty = internal global %struct.tty_driver zeroinitializer, align 8
@zero_t = internal global %struct.termios zeroinitializer, align 4

; Function Attrs: nounwind uwtable
define void @ini() #0 {
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.termios* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1) to i8*), i8* bitcast (%struct.termios* @zero_t to i8*), i64 44, i32 4, i1 false)
  store i32 1, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 0), align 4
  store i32 2, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 1), align 4
  store i32 3, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 2), align 4
  store i32 4, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 3), align 4
  ret void
}

; Function Attrs: nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
  %1 = alloca i32, align 4
  store i32 0, i32* %1
  call void @ini()
  %2 = load i32, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 0), align 4
  %3 = icmp ne i32 %2, 1
  br i1 %3, label %13, label %4

; <label>:4                                       ; preds = %0
  %5 = load i32, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 1), align 4
  %6 = icmp ne i32 %5, 2
  br i1 %6, label %13, label %7

; <label>:7                                       ; preds = %4
  %8 = load i32, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 2), align 4
  %9 = icmp ne i32 %8, 3
  br i1 %9, label %13, label %10

; <label>:10                                      ; preds = %7
  %11 = load i32, i32* getelementptr inbounds (%struct.tty_driver, %struct.tty_driver* @pty, i32 0, i32 1, i32 3), align 4
  %12 = icmp ne i32 %11, 4
  br i1 %12, label %13, label %14

; <label>:13                                      ; preds = %10, %7, %4, %0
  call void @abort() #3
  unreachable

; <label>:14                                      ; preds = %10
  ret i32 0
}

; Function Attrs: noreturn nounwind
declare void @abort() #2

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }
attributes #2 = { noreturn nounwind "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"Ubuntu clang version 3.7.1-svn253571-1~exp1 (branches/release_37) (based on LLVM 3.7.1)"}
