; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/991216-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.__va_list_tag = type { i32, i32, i8*, i8* }

define void @test(i32 %n, ...) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %ap = alloca [1 x %struct.__va_list_tag], align 16
  %i = alloca i32, align 4
  store i32 %n, i32* %n.addr, align 4
  %arraydecay = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1 = bitcast %struct.__va_list_tag* %arraydecay to i8*
  call void @llvm.va_start(i8* %arraydecay1)
  store i32 2, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %1 = load i32* %n.addr, align 4
  %cmp = icmp sle i32 %0, %1
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %arraydecay2 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %2 = va_arg %struct.__va_list_tag* %arraydecay2, i32
  %3 = load i32* %i, align 4
  %cmp3 = icmp ne i32 %2, %3
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay4 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %5 = va_arg %struct.__va_list_tag* %arraydecay4, i64
  %cmp5 = icmp ne i64 %5, 81985529216486895
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %for.end
  %arraydecay8 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %6 = va_arg %struct.__va_list_tag* %arraydecay8, i32
  %cmp9 = icmp ne i32 %6, 85
  br i1 %cmp9, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end7
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end7
  %arraydecay12 = getelementptr inbounds [1 x %struct.__va_list_tag]* %ap, i32 0, i32 0
  %arraydecay1213 = bitcast %struct.__va_list_tag* %arraydecay12 to i8*
  call void @llvm.va_end(i8* %arraydecay1213)
  ret void
}

declare void @llvm.va_start(i8*) nounwind

declare void @abort() noreturn nounwind

declare void @llvm.va_end(i8*) nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  call void (i32, ...)* @test(i32 1, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 2, i32 2, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 3, i32 2, i32 3, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 4, i32 2, i32 3, i32 4, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 5, i32 2, i32 3, i32 4, i32 5, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 6, i32 2, i32 3, i32 4, i32 5, i32 6, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 7, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i64 81985529216486895, i32 85)
  call void (i32, ...)* @test(i32 8, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7, i32 8, i64 81985529216486895, i32 85)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @exit(i32) noreturn nounwind
