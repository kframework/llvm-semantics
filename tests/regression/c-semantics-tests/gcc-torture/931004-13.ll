; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-13.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8, i8 }

define void @f(i32 %n, i32 %x.coerce, i32 %y.coerce, i32 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %y = alloca %struct.tiny, align 4
  %z = alloca %struct.tiny, align 4
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast %struct.tiny* %x to i32*
  store i32 %x.coerce, i32* %0, align 1
  %1 = bitcast %struct.tiny* %y to i32*
  store i32 %y.coerce, i32* %1, align 1
  %2 = bitcast %struct.tiny* %z to i32*
  store i32 %z.coerce, i32* %2, align 1
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %3 = load i8* %c, align 1
  %conv = sext i8 %3 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %4 = load i8* %d, align 1
  %conv2 = sext i8 %4 to i32
  %cmp3 = icmp ne i32 %conv2, 20
  br i1 %cmp3, label %if.then5, label %if.end6

if.then5:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end6:                                          ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %5 = load i8* %e, align 1
  %conv7 = sext i8 %5 to i32
  %cmp8 = icmp ne i32 %conv7, 30
  br i1 %cmp8, label %if.then10, label %if.end11

if.then10:                                        ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end11:                                         ; preds = %if.end6
  %f = getelementptr inbounds %struct.tiny* %x, i32 0, i32 3
  %6 = load i8* %f, align 1
  %conv12 = sext i8 %6 to i32
  %cmp13 = icmp ne i32 %conv12, 40
  br i1 %cmp13, label %if.then15, label %if.end16

if.then15:                                        ; preds = %if.end11
  call void @abort() noreturn nounwind
  unreachable

if.end16:                                         ; preds = %if.end11
  %c17 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %7 = load i8* %c17, align 1
  %conv18 = sext i8 %7 to i32
  %cmp19 = icmp ne i32 %conv18, 11
  br i1 %cmp19, label %if.then21, label %if.end22

if.then21:                                        ; preds = %if.end16
  call void @abort() noreturn nounwind
  unreachable

if.end22:                                         ; preds = %if.end16
  %d23 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %8 = load i8* %d23, align 1
  %conv24 = sext i8 %8 to i32
  %cmp25 = icmp ne i32 %conv24, 21
  br i1 %cmp25, label %if.then27, label %if.end28

if.then27:                                        ; preds = %if.end22
  call void @abort() noreturn nounwind
  unreachable

if.end28:                                         ; preds = %if.end22
  %e29 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %9 = load i8* %e29, align 1
  %conv30 = sext i8 %9 to i32
  %cmp31 = icmp ne i32 %conv30, 31
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end28
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end28
  %f35 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 3
  %10 = load i8* %f35, align 1
  %conv36 = sext i8 %10 to i32
  %cmp37 = icmp ne i32 %conv36, 41
  br i1 %cmp37, label %if.then39, label %if.end40

if.then39:                                        ; preds = %if.end34
  call void @abort() noreturn nounwind
  unreachable

if.end40:                                         ; preds = %if.end34
  %c41 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %11 = load i8* %c41, align 1
  %conv42 = sext i8 %11 to i32
  %cmp43 = icmp ne i32 %conv42, 12
  br i1 %cmp43, label %if.then45, label %if.end46

if.then45:                                        ; preds = %if.end40
  call void @abort() noreturn nounwind
  unreachable

if.end46:                                         ; preds = %if.end40
  %d47 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %12 = load i8* %d47, align 1
  %conv48 = sext i8 %12 to i32
  %cmp49 = icmp ne i32 %conv48, 22
  br i1 %cmp49, label %if.then51, label %if.end52

if.then51:                                        ; preds = %if.end46
  call void @abort() noreturn nounwind
  unreachable

if.end52:                                         ; preds = %if.end46
  %e53 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %13 = load i8* %e53, align 1
  %conv54 = sext i8 %13 to i32
  %cmp55 = icmp ne i32 %conv54, 32
  br i1 %cmp55, label %if.then57, label %if.end58

if.then57:                                        ; preds = %if.end52
  call void @abort() noreturn nounwind
  unreachable

if.end58:                                         ; preds = %if.end52
  %f59 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 3
  %14 = load i8* %f59, align 1
  %conv60 = sext i8 %14 to i32
  %cmp61 = icmp ne i32 %conv60, 42
  br i1 %cmp61, label %if.then63, label %if.end64

if.then63:                                        ; preds = %if.end58
  call void @abort() noreturn nounwind
  unreachable

if.end64:                                         ; preds = %if.end58
  %15 = load i64* %l.addr, align 8
  %cmp65 = icmp ne i64 %15, 123
  br i1 %cmp65, label %if.then67, label %if.end68

if.then67:                                        ; preds = %if.end64
  call void @abort() noreturn nounwind
  unreachable

if.end68:                                         ; preds = %if.end64
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  store i32 0, i32* %retval
  %arrayidx = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %c = getelementptr inbounds %struct.tiny* %arrayidx, i32 0, i32 0
  store i8 10, i8* %c, align 1
  %arrayidx1 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %c2 = getelementptr inbounds %struct.tiny* %arrayidx1, i32 0, i32 0
  store i8 11, i8* %c2, align 1
  %arrayidx3 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %c4 = getelementptr inbounds %struct.tiny* %arrayidx3, i32 0, i32 0
  store i8 12, i8* %c4, align 1
  %arrayidx5 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %d = getelementptr inbounds %struct.tiny* %arrayidx5, i32 0, i32 1
  store i8 20, i8* %d, align 1
  %arrayidx6 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %d7 = getelementptr inbounds %struct.tiny* %arrayidx6, i32 0, i32 1
  store i8 21, i8* %d7, align 1
  %arrayidx8 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %d9 = getelementptr inbounds %struct.tiny* %arrayidx8, i32 0, i32 1
  store i8 22, i8* %d9, align 1
  %arrayidx10 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %e = getelementptr inbounds %struct.tiny* %arrayidx10, i32 0, i32 2
  store i8 30, i8* %e, align 1
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %e12 = getelementptr inbounds %struct.tiny* %arrayidx11, i32 0, i32 2
  store i8 31, i8* %e12, align 1
  %arrayidx13 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %e14 = getelementptr inbounds %struct.tiny* %arrayidx13, i32 0, i32 2
  store i8 32, i8* %e14, align 1
  %arrayidx15 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %f = getelementptr inbounds %struct.tiny* %arrayidx15, i32 0, i32 3
  store i8 40, i8* %f, align 1
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %f17 = getelementptr inbounds %struct.tiny* %arrayidx16, i32 0, i32 3
  store i8 41, i8* %f17, align 1
  %arrayidx18 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %f19 = getelementptr inbounds %struct.tiny* %arrayidx18, i32 0, i32 3
  store i8 42, i8* %f19, align 1
  %arrayidx20 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 0
  %arrayidx21 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx22 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast %struct.tiny* %arrayidx20 to i32*
  %1 = load i32* %0, align 1
  %2 = bitcast %struct.tiny* %arrayidx21 to i32*
  %3 = load i32* %2, align 1
  %4 = bitcast %struct.tiny* %arrayidx22 to i32*
  %5 = load i32* %4, align 1
  call void @f(i32 3, i32 %1, i32 %3, i32 %5, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
