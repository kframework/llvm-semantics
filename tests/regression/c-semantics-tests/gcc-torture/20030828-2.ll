; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030828-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.rtx_def = type { i32 }

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %tmp = alloca [2 x i32], align 4
  %r = alloca %struct.rtx_def*, align 8
  %s = alloca %struct.rtx_def, align 4
  %p = alloca i32*, align 8
  %q = alloca i32*, align 8
  store i32 0, i32* %retval
  store %struct.rtx_def* %s, %struct.rtx_def** %r, align 8
  %0 = load %struct.rtx_def** %r, align 8
  %code = getelementptr inbounds %struct.rtx_def* %0, i32 0, i32 0
  store i32 39, i32* %code, align 4
  %arraydecay = getelementptr inbounds [2 x i32]* %tmp, i32 0, i32 0
  store i32* %arraydecay, i32** %p, align 8
  %1 = load i32** %p, align 8
  %add.ptr = getelementptr inbounds i32* %1, i64 1
  store i32* %add.ptr, i32** %q, align 8
  %2 = load i32** %q, align 8
  store i32 0, i32* %2, align 4
  %arrayidx = getelementptr inbounds [2 x i32]* %tmp, i32 0, i64 1
  store i32 39, i32* %arrayidx, align 4
  %3 = load i32** %q, align 8
  %4 = load i32* %3, align 4
  %cmp = icmp ne i32 %4, 39
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
