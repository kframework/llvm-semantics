; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/931004-9.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tiny = type { i8, i8 }

define void @f(i32 %n, i16 %x.coerce, i16 %y.coerce, i16 %z.coerce, i64 %l) nounwind uwtable {
entry:
  %n.addr = alloca i32, align 4
  %x = alloca %struct.tiny, align 2
  %y = alloca %struct.tiny, align 2
  %z = alloca %struct.tiny, align 2
  %l.addr = alloca i64, align 8
  store i32 %n, i32* %n.addr, align 4
  %0 = bitcast %struct.tiny* %x to i16*
  store i16 %x.coerce, i16* %0, align 1
  %1 = bitcast %struct.tiny* %y to i16*
  store i16 %y.coerce, i16* %1, align 1
  %2 = bitcast %struct.tiny* %z to i16*
  store i16 %z.coerce, i16* %2, align 1
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
  %c7 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 0
  %5 = load i8* %c7, align 1
  %conv8 = sext i8 %5 to i32
  %cmp9 = icmp ne i32 %conv8, 11
  br i1 %cmp9, label %if.then11, label %if.end12

if.then11:                                        ; preds = %if.end6
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %if.end6
  %d13 = getelementptr inbounds %struct.tiny* %y, i32 0, i32 1
  %6 = load i8* %d13, align 1
  %conv14 = sext i8 %6 to i32
  %cmp15 = icmp ne i32 %conv14, 21
  br i1 %cmp15, label %if.then17, label %if.end18

if.then17:                                        ; preds = %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end18:                                         ; preds = %if.end12
  %c19 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 0
  %7 = load i8* %c19, align 1
  %conv20 = sext i8 %7 to i32
  %cmp21 = icmp ne i32 %conv20, 12
  br i1 %cmp21, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end18
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end18
  %d25 = getelementptr inbounds %struct.tiny* %z, i32 0, i32 1
  %8 = load i8* %d25, align 1
  %conv26 = sext i8 %8 to i32
  %cmp27 = icmp ne i32 %conv26, 22
  br i1 %cmp27, label %if.then29, label %if.end30

if.then29:                                        ; preds = %if.end24
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %if.end24
  %9 = load i64* %l.addr, align 8
  %cmp31 = icmp ne i64 %9, 123
  br i1 %cmp31, label %if.then33, label %if.end34

if.then33:                                        ; preds = %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end30
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
  %arrayidx11 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 1
  %arrayidx12 = getelementptr inbounds [3 x %struct.tiny]* %x, i32 0, i64 2
  %0 = bitcast %struct.tiny* %arrayidx10 to i16*
  %1 = load i16* %0, align 1
  %2 = bitcast %struct.tiny* %arrayidx11 to i16*
  %3 = load i16* %2, align 1
  %4 = bitcast %struct.tiny* %arrayidx12 to i16*
  %5 = load i16* %4, align 1
  call void @f(i32 3, i16 %1, i16 %3, i16 %5, i64 123)
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %6 = load i32* %retval
  ret i32 %6
}

declare void @exit(i32) noreturn nounwind
