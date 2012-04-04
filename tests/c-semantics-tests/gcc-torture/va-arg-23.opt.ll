; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-23.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.two = type { i64, i64 }
%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @foo(i32 %a, i32 %b, i32 %c, i32 %d, i32 %e, %struct.two* nocapture byval align 8 %f, i32 %g, ...) nounwind uwtable {
entry:
  %args = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %args, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %args to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp = icmp eq i32 %g, 1
  %cmp3 = icmp eq i32 %0, 2
  %or.cond = and i1 %cmp, %cmp3
  br i1 %or.cond, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %t = alloca %struct.two, align 8
  %0 = bitcast %struct.two* %t to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 16, i32 8, i1 false)
  call void (i32, i32, i32, i32, i32, %struct.two*, i32, ...)* @foo(i32 undef, i32 undef, i32 undef, i32 undef, i32 undef, %struct.two* byval align 8 %t, i32 1, i32 2)
  ret i32 0
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
