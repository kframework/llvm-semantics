; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000706-5.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.baz = type { i32, i32, i32 }

@c = common global %struct.baz* null, align 8

define void @bar(i32 %b) nounwind uwtable {
entry:
  %b.addr = alloca i32, align 4
  store i32 %b, i32* %b.addr, align 4
  %0 = load %struct.baz** @c, align 8
  %a = getelementptr inbounds %struct.baz* %0, i32 0, i32 0
  %1 = load i32* %a, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load %struct.baz** @c, align 8
  %b1 = getelementptr inbounds %struct.baz* %2, i32 0, i32 1
  %3 = load i32* %b1, align 4
  %cmp2 = icmp ne i32 %3, 2
  br i1 %cmp2, label %if.then, label %lor.lhs.false3

lor.lhs.false3:                                   ; preds = %lor.lhs.false
  %4 = load %struct.baz** @c, align 8
  %c = getelementptr inbounds %struct.baz* %4, i32 0, i32 2
  %5 = load i32* %c, align 4
  %cmp4 = icmp ne i32 %5, 3
  br i1 %cmp4, label %if.then, label %lor.lhs.false5

lor.lhs.false5:                                   ; preds = %lor.lhs.false3
  %6 = load i32* %b.addr, align 4
  %cmp6 = icmp ne i32 %6, 4
  br i1 %cmp6, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false5, %lor.lhs.false3, %lor.lhs.false, %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %lor.lhs.false5
  ret void
}

declare void @abort() noreturn

define void @foo(i64 %a.coerce0, i32 %a.coerce1, i32 %b) nounwind uwtable {
entry:
  %a = alloca %struct.baz, align 8
  %coerce = alloca { i64, i32 }, align 8
  %b.addr = alloca i32, align 4
  %0 = getelementptr { i64, i32 }* %coerce, i32 0, i32 0
  store i64 %a.coerce0, i64* %0
  %1 = getelementptr { i64, i32 }* %coerce, i32 0, i32 1
  store i32 %a.coerce1, i32* %1
  %2 = bitcast %struct.baz* %a to i8*
  %3 = bitcast { i64, i32 }* %coerce to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %2, i8* %3, i64 12, i32 8, i1 false)
  store i32 %b, i32* %b.addr, align 4
  store %struct.baz* %a, %struct.baz** @c, align 8
  %4 = load i32* %b.addr, align 4
  call void @bar(i32 %4)
  ret void
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.baz, align 4
  store i32 0, i32* %retval
  %a1 = getelementptr inbounds %struct.baz* %a, i32 0, i32 0
  store i32 1, i32* %a1, align 4
  %b = getelementptr inbounds %struct.baz* %a, i32 0, i32 1
  store i32 2, i32* %b, align 4
  %c = getelementptr inbounds %struct.baz* %a, i32 0, i32 2
  store i32 3, i32* %c, align 4
  %0 = bitcast %struct.baz* %a to { i64, i32 }*
  %1 = getelementptr { i64, i32 }* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr { i64, i32 }* %0, i32 0, i32 1
  %4 = load i32* %3, align 1
  call void @foo(i64 %2, i32 %4, i32 4)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @exit(i32) noreturn
