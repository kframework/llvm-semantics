; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/va-arg-15.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @vafunction(i8* nocapture %dummy, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %flag.0 = phi i32 [ 0, %entry ], [ %inc12, %for.inc ]
  %i.0 = phi i32 [ 1, %entry ], [ %inc, %for.inc ]
  %cmp = icmp slt i32 %i.0, 19
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %and = and i32 %flag.0, 1
  %tobool = icmp eq i32 %and, 0
  br i1 %tobool, label %if.else, label %if.then

if.then:                                          ; preds = %for.body
  %0 = va_arg %struct.__va_list_tag* %arraydecay, double
  %conv = sitofp i32 %i.0 to double
  %cmp3 = fcmp une double %0, %conv
  br i1 %cmp3, label %if.then5, label %for.inc

if.then5:                                         ; preds = %if.then
  call void @abort() noreturn nounwind
  unreachable

if.else:                                          ; preds = %for.body
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp7 = icmp eq i32 %1, %i.0
  br i1 %cmp7, label %for.inc, label %if.then9

if.then9:                                         ; preds = %if.else
  call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.else, %if.then
  %inc = add nsw i32 %i.0, 1
  %inc12 = add nsw i32 %flag.0, 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i8*, ...)* @vafunction(i8* undef, i32 1, double 2.000000e+00, i32 3, double 4.000000e+00, i32 5, double 6.000000e+00, i32 7, double 8.000000e+00, i32 9, double 1.000000e+01, i32 11, double 1.200000e+01, i32 13, double 1.400000e+01, i32 15, double 1.600000e+01, i32 17, double 1.800000e+01)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
