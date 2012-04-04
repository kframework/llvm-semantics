; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/strct-pack-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.A = type <{ i16, [2 x i32] }>

define i32 @f(%struct.A* %ap) nounwind uwtable {
entry:
  %ap.addr = alloca %struct.A*, align 8
  %i = alloca i16, align 2
  %j = alloca i16, align 2
  store %struct.A* %ap, %struct.A** %ap.addr, align 8
  store i16 1, i16* %j, align 2
  %0 = load %struct.A** %ap.addr, align 8
  %f = getelementptr inbounds %struct.A* %0, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i32]* %f, i32 0, i64 1
  %1 = load i32* %arrayidx, align 2
  %conv = trunc i32 %1 to i16
  store i16 %conv, i16* %i, align 2
  %2 = load i16* %j, align 2
  %idxprom = sext i16 %2 to i64
  %3 = load %struct.A** %ap.addr, align 8
  %f1 = getelementptr inbounds %struct.A* %3, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [2 x i32]* %f1, i32 0, i64 %idxprom
  %4 = load i32* %arrayidx2, align 2
  %5 = load i16* %i, align 2
  %conv3 = sext i16 %5 to i32
  %add = add nsw i32 %conv3, %4
  %conv4 = trunc i32 %add to i16
  store i16 %conv4, i16* %i, align 2
  store i16 0, i16* %j, align 2
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %6 = load i16* %j, align 2
  %conv5 = sext i16 %6 to i32
  %cmp = icmp slt i32 %conv5, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %7 = load i16* %j, align 2
  %idxprom7 = sext i16 %7 to i64
  %8 = load %struct.A** %ap.addr, align 8
  %f8 = getelementptr inbounds %struct.A* %8, i32 0, i32 1
  %arrayidx9 = getelementptr inbounds [2 x i32]* %f8, i32 0, i64 %idxprom7
  %9 = load i32* %arrayidx9, align 2
  %10 = load i16* %i, align 2
  %conv10 = sext i16 %10 to i32
  %add11 = add nsw i32 %conv10, %9
  %conv12 = trunc i32 %add11 to i16
  store i16 %conv12, i16* %i, align 2
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %11 = load i16* %j, align 2
  %inc = add i16 %11, 1
  store i16 %inc, i16* %j, align 2
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %12 = load i16* %i, align 2
  %conv13 = sext i16 %12 to i32
  ret i32 %conv13
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct.A, align 2
  store i32 0, i32* %retval
  %f = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x i32]* %f, i32 0, i64 0
  store i32 100, i32* %arrayidx, align 2
  %f1 = getelementptr inbounds %struct.A* %a, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [2 x i32]* %f1, i32 0, i64 1
  store i32 13, i32* %arrayidx2, align 2
  %call = call i32 (...)* bitcast (i32 (%struct.A*)* @f to i32 (...)*)(%struct.A* %a)
  %cmp = icmp ne i32 %call, 139
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
