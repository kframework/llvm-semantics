; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/990128-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.s = type { %struct.s* }

@count = global i32 0, align 4
@ss = common global %struct.s zeroinitializer, align 8
@p = common global %struct.s* null, align 8
@sss = common global [10 x %struct.s] zeroinitializer, align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %pp = alloca %struct.s*, align 8
  %next = alloca %struct.s*, align 8
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store %struct.s* @ss, %struct.s** @p, align 8
  %0 = load %struct.s** @p, align 8
  store %struct.s* %0, %struct.s** %next, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %1 = load i32* %i, align 4
  %cmp = icmp slt i32 %1, 10
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [10 x %struct.s]* @sss, i32 0, i64 %idxprom
  %3 = load %struct.s** %next, align 8
  %n = getelementptr inbounds %struct.s* %3, i32 0, i32 0
  store %struct.s* %arrayidx, %struct.s** %n, align 8
  %4 = load %struct.s** %next, align 8
  %n1 = getelementptr inbounds %struct.s* %4, i32 0, i32 0
  %5 = load %struct.s** %n1, align 8
  store %struct.s* %5, %struct.s** %next, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %6 = load i32* %i, align 4
  %inc = add nsw i32 %6, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %7 = load %struct.s** %next, align 8
  %n2 = getelementptr inbounds %struct.s* %7, i32 0, i32 0
  store %struct.s* null, %struct.s** %n2, align 8
  %8 = load %struct.s** @p, align 8
  call void @sub(%struct.s* %8, %struct.s** %pp)
  %9 = load i32* @count, align 4
  %cmp3 = icmp ne i32 %9, 12
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %for.end
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.end
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %10 = load i32* %retval
  ret i32 %10
}

define void @sub(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %p.addr = alloca %struct.s*, align 8
  %pp.addr = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %p.addr, align 8
  store %struct.s** %pp, %struct.s*** %pp.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %if.end, %entry
  %0 = load %struct.s** %p.addr, align 8
  %1 = load %struct.s*** %pp.addr, align 8
  %call = call i32 @look(%struct.s* %0, %struct.s** %1)
  %tobool = icmp ne i32 %call, 0
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %2 = load %struct.s** %p.addr, align 8
  %tobool1 = icmp ne %struct.s* %2, null
  br i1 %tobool1, label %if.then, label %if.else

if.then:                                          ; preds = %for.body
  %3 = load %struct.s** %p.addr, align 8
  %n = getelementptr inbounds %struct.s* %3, i32 0, i32 0
  %4 = load %struct.s** %n, align 8
  store %struct.s* %4, %struct.s** %p.addr, align 8
  br label %if.end

if.else:                                          ; preds = %for.body
  br label %for.end

if.end:                                           ; preds = %if.then
  br label %for.cond

for.end:                                          ; preds = %if.else, %for.cond
  ret void
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @look(%struct.s* %p, %struct.s** %pp) nounwind uwtable {
entry:
  %p.addr = alloca %struct.s*, align 8
  %pp.addr = alloca %struct.s**, align 8
  store %struct.s* %p, %struct.s** %p.addr, align 8
  store %struct.s** %pp, %struct.s*** %pp.addr, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load %struct.s** %p.addr, align 8
  %tobool = icmp ne %struct.s* %0, null
  br i1 %tobool, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %1 = load %struct.s** %p.addr, align 8
  %n = getelementptr inbounds %struct.s* %1, i32 0, i32 0
  %2 = load %struct.s** %n, align 8
  store %struct.s* %2, %struct.s** %p.addr, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %3 = load %struct.s** %p.addr, align 8
  %4 = load %struct.s*** %pp.addr, align 8
  store %struct.s* %3, %struct.s** %4, align 8
  %5 = load i32* @count, align 4
  %inc = add nsw i32 %5, 1
  store i32 %inc, i32* @count, align 4
  ret i32 1
}
