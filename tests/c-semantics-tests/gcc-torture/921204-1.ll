; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/921204-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%union.bu = type { i32 }
%struct.bf = type { i8, [2 x i8], i8 }

define i32 @f(i32 %i.coerce) nounwind uwtable {
entry:
  %retval = alloca %union.bu, align 4
  %i = alloca %union.bu, align 4
  %o = alloca %union.bu, align 4
  %coerce.dive = getelementptr %union.bu* %i, i32 0, i32 0
  store i32 %i.coerce, i32* %coerce.dive
  %0 = bitcast %union.bu* %o to i8*
  %1 = bitcast %union.bu* %i to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* %1, i64 4, i32 4, i1 false)
  %b = bitcast %union.bu* %o to %struct.bf*
  %2 = bitcast %struct.bf* %b to i32*
  %3 = load i32* %2, align 4
  %bf.clear = and i32 %3, 1
  %tobool = icmp ne i32 %bf.clear, 0
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  %b1 = bitcast %union.bu* %o to %struct.bf*
  %4 = bitcast %struct.bf* %b1 to i32*
  %5 = load i32* %4, align 4
  %6 = and i32 %5, -262145
  %7 = or i32 %6, 262144
  store i32 %7, i32* %4, align 4
  %b2 = bitcast %union.bu* %o to %struct.bf*
  %8 = bitcast %struct.bf* %b2 to i32*
  %9 = load i32* %8, align 4
  %10 = and i32 %9, -1048577
  %11 = or i32 %10, 1048576
  store i32 %11, i32* %8, align 4
  br label %if.end

if.else:                                          ; preds = %entry
  %b3 = bitcast %union.bu* %o to %struct.bf*
  %12 = bitcast %struct.bf* %b3 to i32*
  %13 = load i32* %12, align 4
  %14 = and i32 %13, -262145
  store i32 %14, i32* %12, align 4
  %b4 = bitcast %union.bu* %o to %struct.bf*
  %15 = bitcast %struct.bf* %b4 to i32*
  %16 = load i32* %15, align 4
  %17 = and i32 %16, -1048577
  store i32 %17, i32* %15, align 4
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %18 = bitcast %union.bu* %retval to i8*
  %19 = bitcast %union.bu* %o to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %18, i8* %19, i64 4, i32 4, i1 false)
  %coerce.dive5 = getelementptr %union.bu* %retval, i32 0, i32 0
  %20 = load i32* %coerce.dive5
  ret i32 %20
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %union.bu, align 4
  %r = alloca %union.bu, align 4
  %coerce = alloca %union.bu, align 4
  store i32 0, i32* %retval
  %w = bitcast %union.bu* %a to i32*
  store i32 67108864, i32* %w, align 4
  %b = bitcast %union.bu* %a to %struct.bf*
  %0 = bitcast %struct.bf* %b to i32*
  %1 = load i32* %0, align 4
  %2 = and i32 %1, -2
  store i32 %2, i32* %0, align 4
  %coerce.dive = getelementptr %union.bu* %a, i32 0, i32 0
  %3 = load i32* %coerce.dive
  %call = call i32 @f(i32 %3)
  %coerce.dive1 = getelementptr %union.bu* %coerce, i32 0, i32 0
  store i32 %call, i32* %coerce.dive1
  %4 = bitcast %union.bu* %r to i8*
  %5 = bitcast %union.bu* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* %5, i64 4, i32 4, i1 false)
  %w2 = bitcast %union.bu* %a to i32*
  %6 = load i32* %w2, align 4
  %w3 = bitcast %union.bu* %r to i32*
  %7 = load i32* %w3, align 4
  %cmp = icmp ne i32 %6, %7
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %8 = load i32* %retval
  ret i32 %8
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
