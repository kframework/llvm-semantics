; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20000707-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i32 }
%struct.baz = type { i32, i32, i32 }

@main.x = internal unnamed_addr constant %struct.baz { i32 3, i32 4, i32 5 }, align 4

define void @foo(i32 %a, i32 %b, i32 %c) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %tmp = load i32* %a.addr, align 4
  %cmp = icmp ne i32 %tmp, 4
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn

define void @bar(i64 %x.coerce0, i32 %x.coerce1, i32 %b, i32 %c) nounwind uwtable {
entry:
  %x = alloca %struct.baz, align 8
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %0 = bitcast %struct.baz* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  store i64 %x.coerce0, i64* %1
  %2 = getelementptr %0* %0, i32 0, i32 1
  store i32 %x.coerce1, i32* %2
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  %b1 = getelementptr inbounds %struct.baz* %x, i32 0, i32 1
  %tmp = load i32* %b1, align 4
  %tmp2 = load i32* %b.addr, align 4
  %tmp3 = load i32* %c.addr, align 4
  call void @foo(i32 %tmp, i32 %tmp2, i32 %tmp3)
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.baz, align 4
  store i32 0, i32* %retval
  %tmp = bitcast %struct.baz* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast (%struct.baz* @main.x to i8*), i64 12, i32 4, i1 false)
  %0 = bitcast %struct.baz* %x to %0*
  %1 = getelementptr %0* %0, i32 0, i32 0
  %2 = load i64* %1, align 1
  %3 = getelementptr %0* %0, i32 0, i32 1
  %4 = load i32* %3, align 1
  call void @bar(i64 %2, i32 %4, i32 1, i32 2)
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %5 = load i32* %retval
  ret i32 %5
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @exit(i32) noreturn
