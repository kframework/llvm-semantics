; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20011113-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i8, i8, i8, i8, [4 x i64] }
%struct.U = type { [3 x i64] }
%struct.t = type { [2 x i8], i8, i8, [4 x i64] }

@t = global %0 { i8 26, i8 0, i8 0, i8 0, [4 x i64] [i64 0, i64 21, i64 22, i64 23] }, align 8

define %struct.t* @foo(%struct.t* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.t*, align 8
  %d = alloca %struct.U, align 8
  %u = alloca %struct.U, align 8
  store %struct.t* %x, %struct.t** %x.addr, align 8
  %0 = bitcast %struct.U* %u to i8*
  %tmp = load %struct.t** %x.addr, align 8
  %d1 = getelementptr inbounds %struct.t* %tmp, i32 0, i32 3
  %arrayidx = getelementptr inbounds [4 x i64]* %d1, i32 0, i64 1
  %1 = bitcast i64* %arrayidx to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 1, i1 false)
  %tmp2 = bitcast %struct.U* %d to i8*
  %tmp3 = bitcast %struct.U* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp2, i8* %tmp3, i64 24, i32 8, i1 false)
  %tmp4 = load %struct.t** %x.addr, align 8
  %2 = bitcast %struct.t* %tmp4 to i32*
  %3 = load i32* %2, align 8
  %4 = lshr i32 %3, 16
  %bf.clear = and i32 %4, 255
  %call = call %struct.t* @bar(%struct.U* byval align 8 %d, i32 %bf.clear)
  ret %struct.t* %call
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define %struct.t* @bar(%struct.U* byval align 8 %d, i32 %m) nounwind uwtable {
entry:
  %m.addr = alloca i32, align 4
  store i32 %m, i32* %m.addr, align 4
  %r = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x i64]* %r, i32 0, i64 0
  %tmp = load i64* %arrayidx, align 8
  %cmp = icmp ne i64 %tmp, 21
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %r1 = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [3 x i64]* %r1, i32 0, i64 1
  %tmp3 = load i64* %arrayidx2, align 8
  %cmp4 = icmp ne i64 %tmp3, 22
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false
  %r6 = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx7 = getelementptr inbounds [3 x i64]* %r6, i32 0, i64 2
  %tmp8 = load i64* %arrayidx7, align 8
  %cmp9 = icmp ne i64 %tmp8, 23
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  ret %struct.t* null
}

define %struct.t* @baz(%struct.t* %x) nounwind uwtable {
entry:
  %x.addr = alloca %struct.t*, align 8
  %d = alloca %struct.U, align 8
  %u = alloca %struct.U, align 8
  store %struct.t* %x, %struct.t** %x.addr, align 8
  %r = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx = getelementptr inbounds [3 x i64]* %r, i32 0, i64 0
  store i64 4886718345, i64* %arrayidx, align 8
  %r1 = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx2 = getelementptr inbounds [3 x i64]* %r1, i32 0, i64 1
  store i64 68414056839, i64* %arrayidx2, align 8
  %r3 = getelementptr inbounds %struct.U* %d, i32 0, i32 0
  %arrayidx4 = getelementptr inbounds [3 x i64]* %r3, i32 0, i64 2
  store i64 46118400291, i64* %arrayidx4, align 8
  %0 = bitcast %struct.U* %u to i8*
  %tmp = load %struct.t** %x.addr, align 8
  %d5 = getelementptr inbounds %struct.t* %tmp, i32 0, i32 3
  %arrayidx6 = getelementptr inbounds [4 x i64]* %d5, i32 0, i64 1
  %1 = bitcast i64* %arrayidx6 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 24, i32 1, i1 false)
  %tmp7 = bitcast %struct.U* %d to i8*
  %tmp8 = bitcast %struct.U* %u to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp7, i8* %tmp8, i64 24, i32 8, i1 false)
  %tmp9 = load %struct.t** %x.addr, align 8
  %2 = bitcast %struct.t* %tmp9 to i32*
  %3 = load i32* %2, align 8
  %4 = lshr i32 %3, 16
  %bf.clear = and i32 %4, 255
  %call = call %struct.t* @bar(%struct.U* byval align 8 %d, i32 %bf.clear)
  ret %struct.t* %call
}

declare void @abort() noreturn

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call %struct.t* @baz(%struct.t* bitcast (%0* @t to %struct.t*))
  %call1 = call %struct.t* @foo(%struct.t* bitcast (%0* @t to %struct.t*))
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn
