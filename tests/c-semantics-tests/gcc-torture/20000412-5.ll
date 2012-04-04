; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }

@main.lastglob = private unnamed_addr constant [1 x %struct.anon] [%struct.anon { i32 0, i32 1 }], align 4

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %lastglob = alloca [1 x %struct.anon], align 4
  store i32 0, i32* %retval
  %0 = bitcast [1 x %struct.anon]* %lastglob to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ([1 x %struct.anon]* @main.lastglob to i8*), i64 8, i32 4, i1 false)
  %arrayidx = getelementptr inbounds [1 x %struct.anon]* %lastglob, i32 0, i64 0
  %node = getelementptr inbounds %struct.anon* %arrayidx, i32 0, i32 0
  %1 = load i32* %node, align 4
  %cmp = icmp ne i32 %1, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arrayidx1 = getelementptr inbounds [1 x %struct.anon]* %lastglob, i32 0, i64 0
  %type = getelementptr inbounds %struct.anon* %arrayidx1, i32 0, i32 1
  %2 = load i32* %type, align 4
  %cmp2 = icmp ne i32 %2, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
