; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/struct-cpy-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tty_driver = type { [38 x i8], %struct.termios, [4 x i8] }
%struct.termios = type { i32, i32, i32, i32, [28 x i8] }

@pty = internal global %struct.tty_driver zeroinitializer, align 8
@zero_t = internal global %struct.termios zeroinitializer, align 4

define void @ini() nounwind uwtable {
entry:
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast (%struct.termios* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1) to i8*), i8* bitcast (%struct.termios* @zero_t to i8*), i64 44, i32 4, i1 false)
  store i32 1, i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 0), align 4
  store i32 2, i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 1), align 4
  store i32 3, i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 2), align 4
  store i32 4, i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 3), align 4
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void @ini()
  %0 = load i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 0), align 4
  %cmp = icmp ne i32 %0, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 1), align 4
  %cmp1 = icmp ne i32 %1, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %2 = load i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 2), align 4
  %cmp3 = icmp ne i32 %2, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %3 = load i32* getelementptr inbounds (%struct.tty_driver* @pty, i32 0, i32 1, i32 3), align 4
  %cmp5 = icmp ne i32 %3, 4
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  ret i32 0
}

declare void @abort() noreturn nounwind
