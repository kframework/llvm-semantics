; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920908-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8, [3 x i8] }

define i32 @f(i32 %t.coerce) nounwind uwtable {
entry:
  %t = alloca %struct.T, align 4
  %s = alloca [1 x %struct.T], align 4
  %0 = bitcast %struct.T* %t to i32*
  store i32 %t.coerce, i32* %0, align 1
  %arrayidx = getelementptr inbounds [1 x %struct.T]* %s, i32 0, i64 0
  %1 = bitcast %struct.T* %arrayidx to i8*
  %2 = bitcast %struct.T* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 4, i32 4, i1 false)
  %arraydecay = getelementptr inbounds [1 x %struct.T]* %s, i32 0, i32 0
  %3 = bitcast %struct.T* %arraydecay to i32*
  %4 = load i32* %3, align 4
  %5 = lshr i32 %4, 8
  %bf.clear = and i32 %5, 16777215
  %conv = trunc i32 %bf.clear to i8
  %conv1 = sext i8 %conv to i32
  ret i32 %conv1
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.T, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.T* %t to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -256
  %3 = or i32 %2, 255
  store i32 %3, i32* %0, align 4
  %4 = bitcast %struct.T* %t to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, 255
  %7 = or i32 %6, -61184
  store i32 %7, i32* %4, align 4
  %8 = bitcast %struct.T* %t to i32*
  %9 = load i32* %8, align 1
  %call = call i32 @f(i32 %9)
  %cmp = icmp ne i32 %call, 17
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
