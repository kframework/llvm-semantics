; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr39100.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.E = type { i32, %struct.E* }
%struct.C = type { %struct.E*, i16, i16 }

@main.c = private unnamed_addr constant { %struct.E*, i16, i16, [4 x i8] } { %struct.E* null, i16 0, i16 0, [4 x i8] undef }, align 8

define %struct.C* @foo(%struct.C* %h, %struct.E* %x) nounwind uwtable noinline {
entry:
  %h.addr = alloca %struct.C*, align 8
  %x.addr = alloca %struct.E*, align 8
  %pl = alloca %struct.E*, align 8
  %pa = alloca %struct.E**, align 8
  %nl = alloca %struct.E*, align 8
  %na = alloca %struct.E**, align 8
  %n = alloca %struct.E*, align 8
  store %struct.C* %h, %struct.C** %h.addr, align 8
  store %struct.E* %x, %struct.E** %x.addr, align 8
  store %struct.E* null, %struct.E** %pl, align 8
  store %struct.E** %pl, %struct.E*** %pa, align 8
  store %struct.E* null, %struct.E** %nl, align 8
  store %struct.E** %nl, %struct.E*** %na, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end, %entry
  %0 = load %struct.E** %x.addr, align 8
  %tobool = icmp ne %struct.E* %0, null
  br i1 %tobool, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %1 = load %struct.E** %x.addr, align 8
  %n1 = getelementptr inbounds %struct.E* %1, i32 0, i32 1
  %2 = load %struct.E** %n1, align 8
  store %struct.E* %2, %struct.E** %n, align 8
  %3 = load %struct.E** %x.addr, align 8
  %p = getelementptr inbounds %struct.E* %3, i32 0, i32 0
  %4 = load i32* %p, align 4
  %and = and i32 %4, 1
  %cmp = icmp eq i32 %and, 1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %while.body
  %5 = load %struct.C** %h.addr, align 8
  %cp = getelementptr inbounds %struct.C* %5, i32 0, i32 2
  %6 = load i16* %cp, align 2
  %inc = add i16 %6, 1
  store i16 %inc, i16* %cp, align 2
  %7 = load %struct.E** %x.addr, align 8
  %8 = load %struct.E*** %pa, align 8
  store %struct.E* %7, %struct.E** %8, align 8
  %9 = load %struct.E*** %pa, align 8
  %10 = load %struct.E** %9, align 8
  %n2 = getelementptr inbounds %struct.E* %10, i32 0, i32 1
  store %struct.E** %n2, %struct.E*** %pa, align 8
  br label %if.end

if.else:                                          ; preds = %while.body
  %11 = load %struct.C** %h.addr, align 8
  %cn = getelementptr inbounds %struct.C* %11, i32 0, i32 1
  %12 = load i16* %cn, align 2
  %inc3 = add i16 %12, 1
  store i16 %inc3, i16* %cn, align 2
  %13 = load %struct.E** %x.addr, align 8
  %14 = load %struct.E*** %na, align 8
  store %struct.E* %13, %struct.E** %14, align 8
  %15 = load %struct.E*** %na, align 8
  %16 = load %struct.E** %15, align 8
  %n4 = getelementptr inbounds %struct.E* %16, i32 0, i32 1
  store %struct.E** %n4, %struct.E*** %na, align 8
  br label %if.end

if.end:                                           ; preds = %if.else, %if.then
  %17 = load %struct.E** %n, align 8
  store %struct.E* %17, %struct.E** %x.addr, align 8
  br label %while.cond

while.end:                                        ; preds = %while.cond
  %18 = load %struct.E** %nl, align 8
  %19 = load %struct.E*** %pa, align 8
  store %struct.E* %18, %struct.E** %19, align 8
  %20 = load %struct.E*** %na, align 8
  store %struct.E* null, %struct.E** %20, align 8
  %21 = load %struct.E** %pl, align 8
  %22 = load %struct.C** %h.addr, align 8
  %x5 = getelementptr inbounds %struct.C* %22, i32 0, i32 0
  store %struct.E* %21, %struct.E** %x5, align 8
  %23 = load %struct.C** %h.addr, align 8
  ret %struct.C* %23
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca %struct.C, align 8
  %e = alloca [2 x %struct.E], align 16
  %p3 = alloca %struct.E*, align 8
  store i32 0, i32* %retval
  %0 = bitcast %struct.C* %c to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %0, i8* bitcast ({ %struct.E*, i16, i16, [4 x i8] }* @main.c to i8*), i64 16, i32 8, i1 false)
  %arrayinit.begin = getelementptr inbounds [2 x %struct.E]* %e, i64 0, i64 0
  %p = getelementptr inbounds %struct.E* %arrayinit.begin, i32 0, i32 0
  store i32 0, i32* %p, align 4
  %n = getelementptr inbounds %struct.E* %arrayinit.begin, i32 0, i32 1
  %arrayidx = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  store %struct.E* %arrayidx, %struct.E** %n, align 8
  %arrayinit.element = getelementptr inbounds %struct.E* %arrayinit.begin, i64 1
  %p1 = getelementptr inbounds %struct.E* %arrayinit.element, i32 0, i32 0
  store i32 1, i32* %p1, align 4
  %n2 = getelementptr inbounds %struct.E* %arrayinit.element, i32 0, i32 1
  store %struct.E* null, %struct.E** %n2, align 8
  %arrayidx4 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %call = call %struct.C* @foo(%struct.C* %c, %struct.E* %arrayidx4)
  %cn = getelementptr inbounds %struct.C* %c, i32 0, i32 1
  %1 = load i16* %cn, align 2
  %conv = sext i16 %1 to i32
  %cmp = icmp ne i32 %conv, 1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %cp = getelementptr inbounds %struct.C* %c, i32 0, i32 2
  %2 = load i16* %cp, align 2
  %conv6 = sext i16 %2 to i32
  %cmp7 = icmp ne i32 %conv6, 1
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %x = getelementptr inbounds %struct.C* %c, i32 0, i32 0
  %3 = load %struct.E** %x, align 8
  %arrayidx9 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %cmp10 = icmp ne %struct.E* %3, %arrayidx9
  br i1 %cmp10, label %if.then12, label %if.end13

if.then12:                                        ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %if.end
  %arrayidx14 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 1
  %n15 = getelementptr inbounds %struct.E* %arrayidx14, i32 0, i32 1
  %4 = load %struct.E** %n15, align 8
  %arrayidx16 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %cmp17 = icmp ne %struct.E* %4, %arrayidx16
  br i1 %cmp17, label %if.then19, label %if.end20

if.then19:                                        ; preds = %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end20:                                         ; preds = %if.end13
  %arrayidx21 = getelementptr inbounds [2 x %struct.E]* %e, i32 0, i64 0
  %n22 = getelementptr inbounds %struct.E* %arrayidx21, i32 0, i32 1
  %5 = load %struct.E** %n22, align 8
  %tobool = icmp ne %struct.E* %5, null
  br i1 %tobool, label %if.then23, label %if.end24

if.then23:                                        ; preds = %if.end20
  call void @abort() noreturn nounwind
  unreachable

if.end24:                                         ; preds = %if.end20
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
