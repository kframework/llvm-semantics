; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/restrict-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type { i32, i32 }

@main.a = private unnamed_addr constant %struct.A { i32 1, i32 0 }, align 4

define void @bar(%struct.A* noalias %p) nounwind uwtable {
entry:
  %p.addr = alloca %struct.A*, align 8
  %coerce = alloca %struct.A, align 4
  store %struct.A* %p, %struct.A** %p.addr, align 8
  %0 = load %struct.A** %p.addr, align 8
  %1 = load %struct.A** %p.addr, align 8
  %2 = load %struct.A** %p.addr, align 8
  %call = call i64 @foo(%struct.A* %1, %struct.A* %2)
  %3 = bitcast %struct.A* %coerce to i64*
  store i64 %call, i64* %3, align 1
  %4 = bitcast %struct.A* %0 to i8*
  %5 = bitcast %struct.A* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 8, i32 4, i1 false)
  %6 = load %struct.A** %p.addr, align 8
  %i = getelementptr inbounds %struct.A* %6, i32 0, i32 0
  %7 = load i32* %i, align 4
  %cmp = icmp ne i32 %7, 2
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare i64 @foo(%struct.A*, %struct.A*)

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.A* %a to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.A* @main.a to i8*), i64 8, i32 4, i1 false)
  call void @bar(%struct.A* %a)
  ret i32 0
}
