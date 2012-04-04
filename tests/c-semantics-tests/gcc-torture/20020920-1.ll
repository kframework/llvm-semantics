; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020920-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { i32, i32 }
%struct.A = type { i32, %struct.B }

@f.b = private unnamed_addr constant %struct.B { i32 0, i32 1 }, align 4

define { i64, i32 } @f() nounwind uwtable {
entry:
  %retval = alloca %struct.A, align 4
  %b = alloca %struct.B, align 4
  %a = alloca %struct.A, align 4
  %tmp = alloca { i64, i32 }
  %0 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.B* @f.b to i8*), i64 8, i32 4, i1 false)
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  store i32 2, i32* %z, align 4
  %b1 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %1 = bitcast %struct.B* %b1 to i8*
  %2 = bitcast %struct.B* %b to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %1, i8* %2, i64 8, i32 4, i1 false)
  %3 = bitcast %struct.A* %retval to i8*
  %4 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %3, i8* %4, i64 12, i32 4, i1 false)
  %5 = bitcast { i64, i32 }* %tmp to %struct.A*
  %6 = load %struct.A* %retval
  store %struct.A %6, %struct.A* %5, align 1
  %7 = load { i64, i32 }* %tmp
  ret { i64, i32 } %7
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  %tmp = alloca { i64, i32 }
  store i32 0, i32* %retval
  %call = call { i64, i32 } @f()
  store { i64, i32 } %call, { i64, i32 }* %tmp
  %0 = bitcast { i64, i32 }* %tmp to %struct.A*
  %1 = load %struct.A* %0, align 1
  store %struct.A %1, %struct.A* %a
  %z = getelementptr inbounds %struct.A* %a, i32 0, i32 0
  %2 = load i32* %z, align 4
  %cmp = icmp ne i32 %2, 2
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %x = getelementptr inbounds %struct.B* %b, i32 0, i32 0
  %3 = load i32* %x, align 4
  %cmp1 = icmp ne i32 %3, 0
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %b3 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %y = getelementptr inbounds %struct.B* %b3, i32 0, i32 1
  %4 = load i32* %y, align 4
  %cmp4 = icmp ne i32 %4, 1
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
