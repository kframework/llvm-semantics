; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20060412-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i64, [82 x %struct.S] }
%struct.S = type { i64 }

@t = common global %struct.T zeroinitializer, align 8

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %p = alloca %struct.S*, align 8
  %q = alloca %struct.S*, align 8
  store i32 0, i32* %retval
  store %struct.S* bitcast (%struct.T* @t to %struct.S*), %struct.S** %p, align 8
  %0 = load %struct.S** %p, align 8
  %1 = bitcast %struct.S* %0 to %struct.T*
  %m = getelementptr inbounds %struct.T* %1, i32 0, i32 1
  %arrayidx = getelementptr inbounds [82 x %struct.S]* %m, i32 0, i64 0
  store %struct.S* %arrayidx, %struct.S** %p, align 8
  %2 = load %struct.S** %p, align 8
  %add.ptr = getelementptr inbounds %struct.S* %2, i64 82
  store %struct.S* %add.ptr, %struct.S** %q, align 8
  br label %while.cond

while.cond:                                       ; preds = %while.body, %entry
  %3 = load %struct.S** %q, align 8
  %incdec.ptr = getelementptr inbounds %struct.S* %3, i32 -1
  store %struct.S* %incdec.ptr, %struct.S** %q, align 8
  %4 = load %struct.S** %p, align 8
  %cmp = icmp ugt %struct.S* %incdec.ptr, %4
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %5 = load %struct.S** %q, align 8
  %o = getelementptr inbounds %struct.S* %5, i32 0, i32 0
  store i64 -1, i64* %o, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %6 = load %struct.S** %q, align 8
  %o1 = getelementptr inbounds %struct.S* %6, i32 0, i32 0
  store i64 0, i64* %o1, align 8
  %7 = load %struct.S** %q, align 8
  %8 = load %struct.S** %p, align 8
  %cmp2 = icmp ugt %struct.S* %7, %8
  br i1 %cmp2, label %if.then, label %if.end

if.then:                                          ; preds = %while.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %while.end
  %9 = load %struct.S** %q, align 8
  %10 = load %struct.S** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint %struct.S* %9 to i64
  %sub.ptr.rhs.cast = ptrtoint %struct.S* %10 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, %sub.ptr.rhs.cast
  %sub.ptr.div = sdiv exact i64 %sub.ptr.sub, 8
  %cmp3 = icmp sgt i64 %sub.ptr.div, 0
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
