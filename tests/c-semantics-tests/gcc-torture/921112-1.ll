; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921112-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.u = type { double }
%struct.anon = type { i32, i32 }

@x = common global [2 x %union.u] zeroinitializer, align 16
@v = common global %union.u zeroinitializer, align 8

define void @f(%union.u* %x, i64 %v.coerce) nounwind uwtable {
entry:
  %x.addr = alloca %union.u*, align 8
  %v = alloca %union.u, align 8
  store %union.u* %x, %union.u** %x.addr, align 8
  %coerce.dive = getelementptr %union.u* %v, i32 0, i32 0
  %0 = bitcast double* %coerce.dive to i64*
  store i64 %v.coerce, i64* %0, align 1
  %1 = load %union.u** %x.addr, align 8
  %incdec.ptr = getelementptr inbounds %union.u* %1, i32 1
  store %union.u* %incdec.ptr, %union.u** %x.addr, align 8
  %2 = bitcast %union.u* %incdec.ptr to i8*
  %3 = bitcast %union.u* %v to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 8, i32 8, i1 false)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 1), align 4
  store i32 0, i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 0), align 4
  store i32 1, i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* @v to %struct.anon*), i32 0, i32 0), align 4
  store i32 2, i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* @v to %struct.anon*), i32 0, i32 1), align 4
  %0 = load i64* bitcast (%union.u* @v to i64*), align 1
  call void (...)* bitcast (void (%union.u*, i64)* @f to void (...)*)(%union.u* getelementptr inbounds ([2 x %union.u]* @x, i32 0, i32 0), i64 %0)
  %1 = load i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 0), align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* getelementptr inbounds (%struct.anon* bitcast (%union.u* getelementptr inbounds ([2 x %union.u]* @x, i32 0, i64 1) to %struct.anon*), i32 0, i32 1), align 4
  %cmp1 = icmp ne i32 %2, 2
  br i1 %cmp1, label %if.then, label %if.end

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

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
