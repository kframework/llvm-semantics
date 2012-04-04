; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030914-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { [16 x i32] }

define x86_fp80 @f(i32 %pa, %struct.s* byval align 8 %pb, x86_fp80 %pc) nounwind uwtable {
entry:
  %pa.addr = alloca i32, align 4
  %pc.addr = alloca x86_fp80, align 16
  %i = alloca i32, align 4
  store i32 %pa, i32* %pa.addr, align 4
  store x86_fp80 %pc, x86_fp80* %pc.addr, align 16
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %val = getelementptr inbounds %struct.s* %pb, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %val, i32 0, i64 %idxprom
  %2 = load i32* %arrayidx, align 4
  %conv = sitofp i32 %2 to x86_fp80
  %3 = load x86_fp80* %pc.addr, align 16
  %add = fadd x86_fp80 %3, %conv
  store x86_fp80 %add, x86_fp80* %pc.addr, align 16
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %4 = load i32* %i, align 4
  %inc = add nsw i32 %4, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %5 = load x86_fp80* %pc.addr, align 16
  ret x86_fp80 %5
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca %struct.s, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 16
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 %1, 1
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %val = getelementptr inbounds %struct.s* %x, i32 0, i32 0
  %arrayidx = getelementptr inbounds [16 x i32]* %val, i32 0, i64 %idxprom
  store i32 %add, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %call = call x86_fp80 @f(i32 1, %struct.s* byval align 8 %x, x86_fp80 0xK400C9C40000000000000)
  %cmp1 = fcmp une x86_fp80 %call, 0xK400C9E60000000000000
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
