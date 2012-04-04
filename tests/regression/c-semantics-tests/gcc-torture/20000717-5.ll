; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000717-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.trio = type { i32, i32, i32 }

@main.t = private unnamed_addr constant %struct.trio { i32 1, i32 2, i32 3 }, align 4

define i32 @bar(i32 %i, i32 %j, i32 %k, i64 %t.coerce0, i32 %t.coerce1) nounwind uwtable {
entry:
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %t = alloca %struct.trio, align 8
  %coerce = alloca { i64, i32 }, align 8
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %t.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %t.coerce1, i32* %1
  %2 = bitcast %struct.trio* %t to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  %a = getelementptr inbounds %struct.trio* %t, i32 0, i32 0
  %4 = load i32* %a, align 4
  %cmp = icmp ne i32 %4, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %b = getelementptr inbounds %struct.trio* %t, i32 0, i32 1
  %5 = load i32* %b, align 4
  %cmp1 = icmp ne i32 %5, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %c = getelementptr inbounds %struct.trio* %t, i32 0, i32 2
  %6 = load i32* %c, align 4
  %cmp3 = icmp ne i32 %6, 3
  br i1 %cmp3, label %if.then, label %lor.lhs.false4

lor.lhs.false4:                                   ; preds = %lor.lhs.false2
  %7 = load i32* %i.addr, align 4
  %cmp5 = icmp ne i32 %7, 4
  br i1 %cmp5, label %if.then, label %lor.lhs.false6

lor.lhs.false6:                                   ; preds = %lor.lhs.false4
  %8 = load i32* %j.addr, align 4
  %cmp7 = icmp ne i32 %8, 5
  br i1 %cmp7, label %if.then, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %lor.lhs.false6
  %9 = load i32* %k.addr, align 4
  %cmp9 = icmp ne i32 %9, 6
  br i1 %cmp9, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false8, %lor.lhs.false6, %lor.lhs.false4, %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false8
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind

define i32 @foo(i64 %t.coerce0, i32 %t.coerce1, i32 %i, i32 %j, i32 %k) nounwind uwtable {
entry:
  %t = alloca %struct.trio, align 8
  %coerce = alloca { i64, i32 }, align 8
  %i.addr = alloca i32, align 4
  %j.addr = alloca i32, align 4
  %k.addr = alloca i32, align 4
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %t.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %t.coerce1, i32* %1
  %2 = bitcast %struct.trio* %t to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  store i32 %i, i32* %i.addr, align 4
  store i32 %j, i32* %j.addr, align 4
  store i32 %k, i32* %k.addr, align 4
  %4 = load i32* %i.addr, align 4
  %5 = load i32* %j.addr, align 4
  %6 = load i32* %k.addr, align 4
  %7 = bitcast %struct.trio* %t to { i64, i32 }*
  %8 = getelementptr { i64, i32 }* %7, i32 0, i32 0
  %9 = load i64* %8, align 1
  %10 = getelementptr { i64, i32 }* %7, i32 0, i32 1
  %11 = load i32* %10, align 1
  %call = call i32 @bar(i32 %4, i32 %5, i32 %6, i64 %9, i32 %11)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.trio, align 4
  store i32 0, i32* %retval
  %0 = bitcast %struct.trio* %t to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast (%struct.trio* @main.t to i8*), i64 12, i32 4, i1 false)
  %1 = bitcast %struct.trio* %t to { i64, i32 }*
  %2 = getelementptr { i64, i32 }* %1, i32 0, i32 0
  %3 = load i64* %2, align 1
  %4 = getelementptr { i64, i32 }* %1, i32 0, i32 1
  %5 = load i32* %4, align 1
  %call = call i32 @foo(i64 %3, i32 %5, i32 4, i32 5, i32 6)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
