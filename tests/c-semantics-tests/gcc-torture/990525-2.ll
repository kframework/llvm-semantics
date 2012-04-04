; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990525-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Test1 = type { [4 x i32] }

define i32 @func1() nounwind uwtable {
entry:
  %test = alloca %struct.Test1, align 4
  %coerce = alloca %struct.Test1, align 4
  %call = call { i64, i64 } @func2()
  %coerce.dive = getelementptr %struct.Test1* %coerce, i32 0, i32 0
  %0 = bitcast [4 x i32]* %coerce.dive to { i64, i64 }*
  %1 = getelementptr { i64, i64 }* %0, i32 0, i32 0
  %2 = extractvalue { i64, i64 } %call, 0
  store i64 %2, i64* %1, align 1
  %3 = getelementptr { i64, i64 }* %0, i32 0, i32 1
  %4 = extractvalue { i64, i64 } %call, 1
  store i64 %4, i64* %3, align 1
  %5 = bitcast %struct.Test1* %test to i8*
  %6 = bitcast %struct.Test1* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %5, i8* %6, i64 16, i32 4, i1 false)
  %v = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %v, i32 0, i64 0
  %7 = load i32* %arrayidx, align 4
  %cmp = icmp ne i32 %7, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %v1 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [4 x i32]* %v1, i32 0, i64 1
  %8 = load i32* %arrayidx2, align 4
  %cmp3 = icmp ne i32 %8, 20
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %v6 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [4 x i32]* %v6, i32 0, i64 2
  %9 = load i32* %arrayidx7, align 4
  %cmp8 = icmp ne i32 %9, 30
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end5
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end5
  %v11 = getelementptr inbounds %struct.Test1* %test, i32 0, i32 0
  %arrayidx12 = getelementptr inbounds [4 x i32]* %v11, i32 0, i64 3
  %10 = load i32* %arrayidx12, align 4
  %cmp13 = icmp ne i32 %10, 40
  br i1 %cmp13, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end10
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define { i64, i64 } @func2() nounwind uwtable {
entry:
  %retval = alloca %struct.Test1, align 4
  %tmp = alloca %struct.Test1, align 4
  %v = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x i32]* %v, i32 0, i64 0
  store i32 10, i32* %arrayidx, align 4
  %v1 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [4 x i32]* %v1, i32 0, i64 1
  store i32 20, i32* %arrayidx2, align 4
  %v3 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [4 x i32]* %v3, i32 0, i64 2
  store i32 30, i32* %arrayidx4, align 4
  %v5 = getelementptr inbounds %struct.Test1* %tmp, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [4 x i32]* %v5, i32 0, i64 3
  store i32 40, i32* %arrayidx6, align 4
  %0 = bitcast %struct.Test1* %retval to i8*
  %1 = bitcast %struct.Test1* %tmp to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 16, i32 4, i1 false)
  %coerce.dive = getelementptr %struct.Test1* %retval, i32 0, i32 0
  %2 = bitcast [4 x i32]* %coerce.dive to { i64, i64 }*
  %3 = load { i64, i64 }* %2, align 1
  ret { i64, i64 } %3
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @func1()
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
