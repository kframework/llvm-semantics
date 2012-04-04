; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/920411-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @f(i8* %w) nounwind uwtable {
entry:
  %w.addr = alloca i8*, align 8
  %k = alloca i64, align 8
  %i = alloca i64, align 8
  %c = alloca i64, align 8
  %x = alloca i64, align 8
  %p = alloca i8*, align 8
  store i8* %w, i8** %w.addr, align 8
  store i64 0, i64* %c, align 8
  %0 = bitcast i64* %x to i8*
  store i8* %0, i8** %p, align 8
  store i64 0, i64* %i, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc5, %entry
  %1 = load i64* %i, align 8
  %cmp = icmp slt i64 %1, 1
  br i1 %cmp, label %for.body, label %for.end7

for.body:                                         ; preds = %for.cond
  store i64 0, i64* %k, align 8
  br label %for.cond1

for.cond1:                                        ; preds = %for.inc, %for.body
  %2 = load i64* %k, align 8
  %cmp2 = icmp ult i64 %2, 8
  br i1 %cmp2, label %for.body3, label %for.end

for.body3:                                        ; preds = %for.cond1
  %3 = load i64* %k, align 8
  %4 = load i8** %w.addr, align 8
  %arrayidx = getelementptr inbounds i8* %4, i64 %3
  %5 = load i8* %arrayidx, align 1
  %6 = load i64* %k, align 8
  %7 = load i8** %p, align 8
  %arrayidx4 = getelementptr inbounds i8* %7, i64 %6
  store i8 %5, i8* %arrayidx4, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body3
  %8 = load i64* %k, align 8
  %inc = add nsw i64 %8, 1
  store i64 %inc, i64* %k, align 8
  br label %for.cond1

for.end:                                          ; preds = %for.cond1
  %9 = load i64* %x, align 8
  %10 = load i64* %c, align 8
  %add = add nsw i64 %10, %9
  store i64 %add, i64* %c, align 8
  br label %for.inc5

for.inc5:                                         ; preds = %for.end
  %11 = load i64* %i, align 8
  %inc6 = add nsw i64 %11, 1
  store i64 %inc6, i64* %i, align 8
  br label %for.cond

for.end7:                                         ; preds = %for.cond
  %12 = load i64* %c, align 8
  ret i64 %12
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %a = alloca [8 x i8], align 1
  store i32 0, i32* %retval
  store i32 8, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.body, %entry
  %0 = load i32* %i, align 4
  %dec = add nsw i32 %0, -1
  store i32 %dec, i32* %i, align 4
  %cmp = icmp sge i32 %dec, 0
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %arrayidx = getelementptr inbounds [8 x i8]* %a, i32 0, i64 %idxprom
  store i8 32, i8* %arrayidx, align 1
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [8 x i8]* %a, i32 0, i32 0
  %call = call i64 (...)* bitcast (i64 (i8*)* @f to i64 (...)*)(i8* %arraydecay)
  %cmp1 = icmp ne i64 %call, 2314885530818453536
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %2 = load i32* %retval
  ret i32 %2
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
