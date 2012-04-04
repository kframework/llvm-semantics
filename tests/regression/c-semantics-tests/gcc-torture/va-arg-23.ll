; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-23.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.two = type { i64, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @foo(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, %struct.two* byval align 8 %f, i32 %g, ...) nounwind uwtable {
entry:
  %a.addr = alloca i32, align 4
  %b.addr = alloca i32, align 4
  %c.addr = alloca i32, align 4
  %d.addr = alloca i32, align 4
  %e.addr = alloca i32, align 4
  %g.addr = alloca i32, align 4
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %h = alloca i32, align 4
  store i32 %a, i32* %a.addr, align 4
  store i32 %b, i32* %b.addr, align 4
  store i32 %c, i32* %c.addr, align 4
  store i32 %d, i32* %d.addr, align 4
  store i32 %e, i32* %e.addr, align 4
  store i32 %g, i32* %g.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i32 0, i32 0
  %0 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  store i32 %0, i32* %h, align 4
  %1 = load i32* %g.addr, align 4
  %cmp = icmp ne i32 %1, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %2 = load i32* %h, align 4
  %cmp3 = icmp ne i32 %2, 2
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %t = alloca %struct.two, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.two* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false)
  call void (i32, i32, i32, i32, i32, %struct.two*, i32, ...)* @foo(i32 0, i32 0, i32 0, i32 0, i32 0, %struct.two* byval align 8 %t, i32 1, i32 2)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
