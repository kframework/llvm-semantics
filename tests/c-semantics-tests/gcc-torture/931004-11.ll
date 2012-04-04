; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-11.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8, i8 }

define void @f(i32 %n, i24 %x.coerce, i24 %y.coerce, i24 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 4
  %tmp = alloca i24
  %y = alloca %struct.tiny, align 4
  %tmp1 = alloca i24
  %z = alloca %struct.tiny, align 4
  %tmp2 = alloca i24
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  store i24 %x.coerce, i24* %tmp
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %0, align 1
  store %struct.tiny %1, %struct.tiny* %x
  store i24 %y.coerce, i24* %tmp1
  %2 = bitcast i24* %tmp1 to %struct.tiny*
  %3 = load %struct.tiny* %2, align 1
  store %struct.tiny %3, %struct.tiny* %y
  store i24 %z.coerce, i24* %tmp2
  %4 = bitcast i24* %tmp2 to %struct.tiny*
  %5 = load %struct.tiny* %4, align 1
  store %struct.tiny %5, %struct.tiny* %z
  store i64 %l, i64* %l.addr, align 8
  %c = getelementptr inbounds %struct.tiny* %x, i32 0, i32 0
  %6 = load i8* %c, align 1
  %conv = sext i8 %6 to i32
  %cmp = icmp ne i32 %conv, 10
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %d = getelementptr inbounds %struct.tiny* %x, i32 0, i32 1
  %7 = load i8* %d, align 1
  %conv4 = sext i8 %7 to i32
  %cmp5 = icmp ne i32 %conv4, 20
  br i1 %cmp5, label %if.then7, label %if.end8

if.then7:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end8:                                          ; preds = %if.end
  %e = getelementptr inbounds %struct.tiny* %x, i32 0, i32 2
  %8 = load i8* %e, align 1
  %conv9 = sext i8 %8 to i32
  %cmp10 = icmp ne i32 %conv9, 30
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end8
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end8
  %c14 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %9 = load i8* %c14, align 1
  %conv15 = sext i8 %9 to i32
  %cmp16 = icmp ne i32 %conv15, 11
  br i1 %cmp16, label %if.then18, label %if.end19

if.then18:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end19:                                         ; preds = %if.end13
  %d20 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %10 = load i8* %d20, align 1
  %conv21 = sext i8 %10 to i32
  %cmp22 = icmp ne i32 %conv21, 21
  br i1 %cmp22, label %if.then24, label %if.end25

if.then24:                                        ; preds = %if.end19
  call void @abort() noreturn nounwind
  unreachable

if.end25:                                         ; preds = %if.end19
  %e26 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 2
  %11 = load i8* %e26, align 1
  %conv27 = sext i8 %11 to i32
  %cmp28 = icmp ne i32 %conv27, 31
  br i1 %cmp28, label %if.then30, label %if.end31

if.then30:                                        ; preds = %if.end25
  call void @abort() noreturn nounwind
  unreachable

if.end31:                                         ; preds = %if.end25
  %c32 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %12 = load i8* %c32, align 1
  %conv33 = sext i8 %12 to i32
  %cmp34 = icmp ne i32 %conv33, 12
  br i1 %cmp34, label %if.then36, label %if.end37

if.then36:                                        ; preds = %if.end31
  call void @abort() noreturn nounwind
  unreachable

if.end37:                                         ; preds = %if.end31
  %d38 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %13 = load i8* %d38, align 1
  %conv39 = sext i8 %13 to i32
  %cmp40 = icmp ne i32 %conv39, 22
  br i1 %cmp40, label %if.then42, label %if.end43

if.then42:                                        ; preds = %if.end37
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %if.end37
  %e44 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 2
  %14 = load i8* %e44, align 1
  %conv45 = sext i8 %14 to i32
  %cmp46 = icmp ne i32 %conv45, 32
  br i1 %cmp46, label %if.then48, label %if.end49

if.then48:                                        ; preds = %if.end43
  call void @abort() noreturn nounwind
  unreachable

if.end49:                                         ; preds = %if.end43
  %15 = load i64* %l.addr, align 8
  %cmp50 = icmp ne i64 %15, 123
  br i1 %cmp50, label %if.then52, label %if.end53

if.then52:                                        ; preds = %if.end49
  call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end49
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [3 x %struct.tiny], align 1
  %tmp = alloca i24
  %tmp18 = alloca i24
  %tmp19 = alloca i24
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
  %arrayidx16 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx17 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast i24* %tmp to %struct.tiny*
  %1 = load %struct.tiny* %arrayidx15
  store %struct.tiny %1, %struct.tiny* %0, align 1
  %2 = load i24* %tmp
  %3 = bitcast i24* %tmp18 to %struct.tiny*
  %4 = load %struct.tiny* %arrayidx16
  store %struct.tiny %4, %struct.tiny* %3, align 1
  %5 = load i24* %tmp18
  %6 = bitcast i24* %tmp19 to %struct.tiny*
  %7 = load %struct.tiny* %arrayidx17
  store %struct.tiny %7, %struct.tiny* %6, align 1
  %8 = load i24* %tmp19
  call void @f(i32 3, i24 %2, i24 %5, i24 %8, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @exit(i32) noreturn nounwind
