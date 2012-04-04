; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991216-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @test(i32 %n, ...) nounwind uwtable {
entry:
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i64 0, i64 0
  %arraydecay1 = bitcast [1 x %struct.__va_list_tag]* %ap to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %i.0 = phi i32 [ 2, %entry ], [ %inc, %for.body ]
  %cmp = icmp sgt i32 %i.0, %n
  br i1 %cmp, label %for.end, label %for.body

for.body:                                         ; preds = %for.cond
  %0 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp3 = icmp eq i32 %0, %i.0
  %inc = add nsw i32 %i.0, 1
  br i1 %cmp3, label %for.cond, label %if.then

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

for.end:                                          ; preds = %for.cond
  %1 = va_arg %struct.__va_list_tag* %arraydecay, i64
  %cmp5 = icmp eq i64 %1, 81985529216486895
  br i1 %cmp5, label %if.end7, label %if.then6

if.then6:                                         ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %for.end
  %2 = va_arg %struct.__va_list_tag* %arraydecay, i32
  %cmp9 = icmp eq i32 %2, 85
  br i1 %cmp9, label %if.end11, label %if.then10

if.then10:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end7
  call void @llvm.va_end(i8* %arraydecay1)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  tail call void (i32, ...)* @test(i32 1, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 2, i32 2, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 3, i32 2, i32 3, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 4, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 5, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 6, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  tail call void (i32, ...)* @test(i32 8, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
