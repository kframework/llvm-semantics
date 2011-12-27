; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020920-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.A = type { i32, %struct.B }
%struct.B = type { i32, i32 }

@f.b = internal unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4

define %0 @f() nounwind uwtable {
entry:
  %retval = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %tmp7 = alloca %0
  %tmp = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %z, align 4
  %b2 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %tmp3 = bitcast %struct.B* %b2 to i8*
  %tmp4 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp3, i8* %tmp4, i64 8, i32 4, i1 false)
  %tmp5 = bitcast %struct.A* %retval to i8*
  %tmp6 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp5, i8* %tmp6, i64 12, i32 4, i1 false)
  %0 = bitcast %0* %tmp7 to %struct.A*
  %1 = load %struct.A* %retval
  store %struct.A %1, %struct.A* %0, align 1
  %2 = load %0* %tmp7
  ret %0 %2
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %tmp = alloca %0
  store i32 0, i32* %retval
  %call = call %0 @f()
  store %0 %call, %0* %tmp
  %0 = bitcast %0* %tmp to %struct.A*
  %1 = load %struct.A* %0, align 1
  store %struct.A %1, %struct.A* %a
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %tmp1 = load i32* %z, align 4
  %cmp = icmp ne i32 %tmp1, 2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %tmp2 = load i32* %x, align 4
  %cmp3 = icmp ne i32 %tmp2, 0
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false
  %b5 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y = getelementptr inbounds %struct.B* %b5, i32 0, i32 1
  %tmp6 = load i32* %y, align 4
  %cmp7 = icmp ne i32 %tmp6, 1
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false4, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false4
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
