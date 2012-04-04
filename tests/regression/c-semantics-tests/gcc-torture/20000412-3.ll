; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20000412-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.X = type { i8, [32 x i8] }

define i32 @z() nounwind uwtable {
entry:
  %xxx = alloca %struct.X, align 8
  %x = getelementptr inbounds %struct.X* %xxx, i32 0, i32 1
  %arrayidx = getelementptr inbounds [32 x i8]* %x, i32 0, i64 31
  store i8 48, i8* %arrayidx, align 1
  %x1 = getelementptr inbounds %struct.X* %xxx, i32 0, i32 1
  %arrayidx2 = getelementptr inbounds [32 x i8]* %x1, i32 0, i64 0
  store i8 48, i8* %arrayidx2, align 1
  %y = getelementptr inbounds %struct.X* %xxx, i32 0, i32 0
  store i8 15, i8* %y, align 1
  %call = call i32 (...)* bitcast (i32 (%struct.X*, %struct.X*)* @f to i32 (...)*)(%struct.X* byval align 8 %xxx, %struct.X* byval align 8 %xxx)
  ret i32 %call
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %val = alloca i32, align 4
  store i32 0, i32* %retval
  %call = call i32 @z()
  store i32 %call, i32* %val, align 4
  %0 = load i32* %val, align 4
  %cmp = icmp ne i32 %0, 96
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load i32* %retval
  ret i32 %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i32 @f(%struct.X* byval align 8 %x, %struct.X* byval align 8 %y) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %y1 = getelementptr inbounds %struct.X* %x, i32 0, i32 0
  %0 = load i8* %y1, align 1
  %conv = sext i8 %0 to i32
  %y2 = getelementptr inbounds %struct.X* %y, i32 0, i32 0
  %1 = load i8* %y2, align 1
  %conv3 = sext i8 %1 to i32
  %cmp = icmp ne i32 %conv, %conv3
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  store i32 70, i32* %retval
  br label %return

if.end:                                           ; preds = %entry
  %x5 = getelementptr inbounds %struct.X* %x, i32 0, i32 1
  %arrayidx = getelementptr inbounds [32 x i8]* %x5, i32 0, i64 0
  %2 = load i8* %arrayidx, align 1
  %conv6 = sext i8 %2 to i32
  %x7 = getelementptr inbounds %struct.X* %y, i32 0, i32 1
  %arrayidx8 = getelementptr inbounds [32 x i8]* %x7, i32 0, i64 0
  %3 = load i8* %arrayidx8, align 1
  %conv9 = sext i8 %3 to i32
  %add = add nsw i32 %conv6, %conv9
  store i32 %add, i32* %retval
  br label %return

return:                                           ; preds = %if.end, %if.then
  %4 = load i32* %retval
  ret i32 %4
}
