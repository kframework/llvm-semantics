; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr36093.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.Foo = type { [4 x %struct.Bar], [124 x i8] }
%struct.Bar = type { [129 x i8] }

@foo = common global [4 x %struct.Foo] zeroinitializer, align 128

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %foop = alloca %struct.Foo*, align 8
  %bar = alloca %struct.Bar*, align 8
  store i32 0, i32* %retval
  store %struct.Foo* getelementptr inbounds ([4 x %struct.Foo]* @foo, i32 0, i64 0), %struct.Foo** %foop, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc7, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 4
  br i1 %cmp, label %for.body, label %for.end9

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.Foo** %foop, align 8
  %bar1 = getelementptr inbounds %struct.Foo* %2, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x %struct.Bar]* %bar1, i32 0, i64 %idxprom
  store %struct.Bar* %arrayidx, %struct.Bar** %bar, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc, %for.body
  %3 = load i32* %j, align 4
  %cmp3 = icmp slt i32 %3, 129
  br i1 %cmp3, label %for.body4, label %for.end

for.body4:                                        ; preds = %for.cond2
  %4 = load i32* %i, align 4
  %add = add nsw i32 97, %4
  %conv = trunc i32 %add to i8
  %5 = load i32* %j, align 4
  %idxprom5 = sext i32 %5 to i64
  %6 = load %struct.Bar** %bar, align 8
  %c = getelementptr inbounds %struct.Bar* %6, i32 0, i32 0
  %arrayidx6 = getelementptr inbounds [129 x i8]* %c, i32 0, i64 %idxprom5
  store i8 %conv, i8* %arrayidx6, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body4
  %7 = load i32* %j, align 4
  %inc = add nsw i32 %7, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond2

for.end:                                          ; preds = %for.cond2
  br label %for.inc7

for.inc7:                                         ; preds = %for.end
  %8 = load i32* %i, align 4
  %inc8 = add nsw i32 %8, 1
  store i32 %inc8, i32* %i, align 4
  br label %for.cond

for.end9:                                         ; preds = %for.cond
  %9 = load i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i32 0, i64 0, i32 0, i64 3, i32 0, i64 128), align 1
  %conv10 = sext i8 %9 to i32
  %cmp11 = icmp ne i32 %conv10, 100
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.end9
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end9
  ret i32 0
}

declare void @abort() noreturn
