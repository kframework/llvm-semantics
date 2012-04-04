; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-3.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i16 }

define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 2
  %y = alloca %struct.tiny, align 2
  %z = alloca %struct.tiny, align 2
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %coerce.dive = getelementptr %struct.tiny* %x, i32 0, i32 0
  store i16 %x.coerce, i16* %coerce.dive
  %coerce.dive1 = getelementptr %struct.tiny* %y, i32 0, i32 0
  store i16 %y.coerce, i16* %coerce.dive1
  %coerce.dive2 = getelementptr %struct.tiny* %z, i32 0, i32 0
  store i16 %z.coerce, i16* %coerce.dive2
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %0 = load i16* %c, align 2
  %conv = sext i16 %0 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %c4 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %1 = load i16* %c4, align 2
  %conv5 = sext i16 %1 to i32
  %cmp6 = icmp ne i32 %conv5, 11
  br i1 %cmp6, label %if.then8, label %if.end9

if.then8:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end
  %c10 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %2 = load i16* %c10, align 2
  %conv11 = sext i16 %2 to i32
  %cmp12 = icmp ne i32 %conv11, 12
  br i1 %cmp12, label %if.then14, label %if.end15

if.then14:                                        ; preds = %if.end9
  call void @abort() noreturn nounwind
  unreachable

if.end15:                                         ; preds = %if.end9
  %3 = load i64* %l.addr, align 8
  %cmp16 = icmp ne i64 %3, 123
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end15
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end15
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 2
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i16 10, i16* %c, align 2
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i16 11, i16* %c2, align 2
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i16 12, i16* %c4, align 2
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx7 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %coerce.dive = getelementptr %struct.tiny* %arrayidx5, i32 0, i32 0
  %0 = load i16* %coerce.dive
  %coerce.dive8 = getelementptr %struct.tiny* %arrayidx6, i32 0, i32 0
  %1 = load i16* %coerce.dive8
  %coerce.dive9 = getelementptr %struct.tiny* %arrayidx7, i32 0, i32 0
  %2 = load i16* %coerce.dive9
  call void @f(i32 3, i16 %0, i16 %1, i16 %2, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

declare void @exit(i32) noreturn nounwind
