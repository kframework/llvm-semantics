; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990525-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.blah = type { i32, i32 }

@main.s = private unnamed_addr constant %struct.blah { i32 1, i32 2 }, align 4

define void @die(i64 %arg.coerce) nounwind uwtable {
entry:
  %arg = alloca %struct.blah, align 8
  %i = alloca i32, align 4
  %buf = alloca [1 x %struct.blah], align 4
  %0 = bitcast %struct.blah* %arg to i64*
  store i64 %arg.coerce, i64* %0, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [1 x %struct.blah]* %buf, i32 0, i64 %idxprom
  %3 = bitcast %struct.blah* %arrayidx to i8*
  %4 = bitcast %struct.blah* %arg to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 8, i32 4, i1 false)
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arrayidx1 = getelementptr inbounds [1 x %struct.blah]* %buf, i32 0, i64 0
  %m1 = getelementptr inbounds %struct.blah* %arrayidx1, i32 0, i32 0
  %5 = load i32* %m1, align 4
  %cmp2 = icmp ne i32 %5, 1
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %s = alloca %struct.blah, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.blah* %s to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.blah* @main.s to i8*), i64 8, i32 4, i1 false)
  %1 = bitcast %struct.blah* %s to i64*
  %2 = load i64* %1, align 1
  call void @die(i64 %2)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind
