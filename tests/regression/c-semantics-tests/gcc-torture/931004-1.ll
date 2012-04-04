; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i32 }

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %y = alloca %struct.tiny, align 4
  %z = alloca %struct.tiny, align 4
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %coerce.dive = getelementptr %struct.tiny* %x, i32 0, i32 0
  store i32 %x.coerce, i32* %coerce.dive
  %coerce.dive1 = getelementptr %struct.tiny* %y, i32 0, i32 0
  store i32 %y.coerce, i32* %coerce.dive1
  %coerce.dive2 = getelementptr %struct.tiny* %z, i32 0, i32 0
  store i32 %z.coerce, i32* %coerce.dive2
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %0 = load i32* %c, align 4
  %cmp = icmp ne i32 %0, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %c3 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %1 = load i32* %c3, align 4
  %cmp4 = icmp ne i32 %1, 11
  br i1 %cmp4, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %c7 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %2 = load i32* %c7, align 4
  %cmp8 = icmp ne i32 %2, 12
  br i1 %cmp8, label %if.then9, label %if.end10

if.then9:                                         ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end10:                                         ; preds = %if.end6
  %3 = load i64* %l.addr, align 8
  %cmp11 = icmp ne i64 %3, 123
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end10
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end10
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 4
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i32 10, i32* %c, align 4
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i32 11, i32* %c2, align 4
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i32 12, i32* %c4, align 4
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %coerce.dive = getelementptr %struct.tiny* %arrayidx5, i32 0, i32 0
  %0 = load i32* %coerce.dive
  %coerce.dive8 = getelementptr %struct.tiny* %arrayidx6, i32 0, i32 0
  %1 = load i32* %coerce.dive8
  %coerce.dive9 = getelementptr %struct.tiny* %arrayidx7, i32 0, i32 0
  %2 = load i32* %coerce.dive9
  call void @f(i32 3, i32 %0, i32 %1, i32 %2, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind
