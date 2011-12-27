; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr36093.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Bar = type { [129 x i8] }
%struct.Foo = type { [4 x %struct.Bar], [124 x i8] }

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

for.cond:                                         ; preds = %for.inc15, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 4
  br i1 %cmp, label %for.body, label %for.end18

for.body:                                         ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %idxprom = sext i32 %tmp2 to i64
  %tmp3 = load %struct.Foo** %foop, align 8
  %bar4 = getelementptr inbounds %struct.Foo* %tmp3, i32 0, i32 0
  %arrayidx = getelementptr inbounds [4 x %struct.Bar]* %bar4, i32 0, i64 %idxprom
  store %struct.Bar* %arrayidx, %struct.Bar** %bar, align 8
  store i32 0, i32* %j, align 4
  br label %for.cond5

for.cond5:                                        ; preds = %for.inc, %for.body
  %tmp6 = load i32* %j, align 4
  %cmp7 = icmp slt i32 %tmp6, 129
  br i1 %cmp7, label %for.body8, label %for.end

for.body8:                                        ; preds = %for.cond5
  %tmp9 = load i32* %i, align 4
  %add = add nsw i32 97, %tmp9
  %conv = trunc i32 %add to i8
  %tmp10 = load i32* %j, align 4
  %idxprom11 = sext i32 %tmp10 to i64
  %tmp12 = load %struct.Bar** %bar, align 8
  %c = getelementptr inbounds %struct.Bar* %tmp12, i32 0, i32 0
  %arrayidx13 = getelementptr inbounds [129 x i8]* %c, i32 0, i64 %idxprom11
  store i8 %conv, i8* %arrayidx13, align 1
  br label %for.inc

for.inc:                                          ; preds = %for.body8
  %tmp14 = load i32* %j, align 4
  %inc = add nsw i32 %tmp14, 1
  store i32 %inc, i32* %j, align 4
  br label %for.cond5

for.end:                                          ; preds = %for.cond5
  br label %for.inc15

for.inc15:                                        ; preds = %for.end
  %tmp16 = load i32* %i, align 4
  %inc17 = add nsw i32 %tmp16, 1
  store i32 %inc17, i32* %i, align 4
  br label %for.cond

for.end18:                                        ; preds = %for.cond
  %tmp19 = load i8* getelementptr inbounds ([4 x %struct.Foo]* @foo, i32 0, i64 0, i32 0, i64 3, i32 0, i64 128), align 1
  %conv20 = sext i8 %tmp19 to i32
  %cmp21 = icmp ne i32 %conv20, 100
  br i1 %cmp21, label %if.then, label %if.end

if.then:                                          ; preds = %for.end18
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %for.end18
  ret i32 0
}

declare void @abort() noreturn
