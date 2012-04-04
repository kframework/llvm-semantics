; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010915-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@check = global i32 0, align 4
@o = global i32 0, align 4
@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"d\00", align 1
@.str4 = private unnamed_addr constant [2 x i8] c"e\00", align 1
@h = common global i8* null, align 8
@u = common global i8* null, align 8
@r.c = internal global [2 x i8] c"b\00", align 1
@r.cnt = internal global i32 0, align 4

define i32 @main(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %args = alloca [5 x i8*], align 16
  store i32 0, i32* %retval
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  %0 = bitcast [5 x i8*]* %args to i8*
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 40, i32 16, i1 false)
  %1 = bitcast i8* %0 to [5 x i8*]*
  %2 = getelementptr [5 x i8*]* %1, i32 0, i32 0
  store i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8** %2
  %3 = getelementptr [5 x i8*]* %1, i32 0, i32 1
  store i8* getelementptr inbounds ([2 x i8]* @.str1, i32 0, i32 0), i8** %3
  %4 = getelementptr [5 x i8*]* %1, i32 0, i32 2
  store i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8** %4
  %5 = getelementptr [5 x i8*]* %1, i32 0, i32 3
  store i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0), i8** %5
  %6 = getelementptr [5 x i8*]* %1, i32 0, i32 4
  store i8* getelementptr inbounds ([2 x i8]* @.str4, i32 0, i32 0), i8** %6
  %arraydecay = getelementptr inbounds [5 x i8*]* %args, i32 0, i32 0
  %call = call i32 @x(i32 5, i8** %arraydecay)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %7 = load i32* @check, align 4
  %cmp1 = icmp ne i32 %7, 2
  br i1 %cmp1, label %if.then, label %lor.lhs.false2

lor.lhs.false2:                                   ; preds = %lor.lhs.false
  %8 = load i32* @o, align 4
  %cmp3 = icmp ne i32 %8, 5
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false2, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false2
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

define i32 @x(i32 %argc, i8** %argv) nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %opt = alloca i32, align 4
  %g = alloca i8*, align 8
  %p = alloca i8*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 0, i32* %opt, align 4
  store i8* null, i8** %g, align 8
  store i8* null, i8** %p, align 8
  %0 = load i32* %argc.addr, align 4
  %1 = load i32* @o, align 4
  %cmp = icmp sgt i32 %0, %1
  br i1 %cmp, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* %argc.addr, align 4
  %cmp1 = icmp sgt i32 %2, 2
  br i1 %cmp1, label %land.lhs.true2, label %if.else

land.lhs.true2:                                   ; preds = %land.lhs.true
  %3 = load i32* @o, align 4
  %idxprom = sext i32 %3 to i64
  %4 = load i8*** %argv.addr, align 8
  %arrayidx = getelementptr inbounds i8** %4, i64 %idxprom
  %5 = load i8** %arrayidx, align 8
  %tobool = icmp ne i8* %5, null
  br i1 %tobool, label %if.then, label %if.else

if.then:                                          ; preds = %land.lhs.true2
  %6 = load i32* @o, align 4
  %idxprom3 = sext i32 %6 to i64
  %7 = load i8*** %argv.addr, align 8
  %arrayidx4 = getelementptr inbounds i8** %7, i64 %idxprom3
  %8 = load i8** %arrayidx4, align 8
  %call = call i8* @s(i8* %8, i8** %p)
  store i8* %call, i8** %g, align 8
  %9 = load i8** %g, align 8
  %tobool5 = icmp ne i8* %9, null
  br i1 %tobool5, label %if.then6, label %if.end11

if.then6:                                         ; preds = %if.then
  %10 = load i8** %g, align 8
  %incdec.ptr = getelementptr inbounds i8* %10, i32 1
  store i8* %incdec.ptr, i8** %g, align 8
  store i8 0, i8* %10, align 1
  %11 = load i8** %g, align 8
  %call7 = call i8* @s(i8* %11, i8** %p)
  store i8* %call7, i8** @h, align 8
  %12 = load i8** %g, align 8
  %13 = load i8** %p, align 8
  %cmp8 = icmp eq i8* %12, %13
  br i1 %cmp8, label %if.then9, label %if.end

if.then9:                                         ; preds = %if.then6
  %14 = load i8** %g, align 8
  %call10 = call i8* @m(i8* %14)
  store i8* %call10, i8** @h, align 8
  br label %if.end

if.end:                                           ; preds = %if.then9, %if.then6
  br label %if.end11

if.end11:                                         ; preds = %if.end, %if.then
  %15 = load i32* @o, align 4
  %idxprom12 = sext i32 %15 to i64
  %16 = load i8*** %argv.addr, align 8
  %arrayidx13 = getelementptr inbounds i8** %16, i64 %idxprom12
  %17 = load i8** %arrayidx13, align 8
  %call14 = call i8* @s(i8* %17, i8** %p)
  store i8* %call14, i8** @u, align 8
  %18 = load i32* @o, align 4
  %idxprom15 = sext i32 %18 to i64
  %19 = load i8*** %argv.addr, align 8
  %arrayidx16 = getelementptr inbounds i8** %19, i64 %idxprom15
  %20 = load i8** %arrayidx16, align 8
  %21 = load i8** %p, align 8
  %cmp17 = icmp eq i8* %20, %21
  br i1 %cmp17, label %if.then18, label %if.end22

if.then18:                                        ; preds = %if.end11
  %22 = load i32* @o, align 4
  %idxprom19 = sext i32 %22 to i64
  %23 = load i8*** %argv.addr, align 8
  %arrayidx20 = getelementptr inbounds i8** %23, i64 %idxprom19
  %24 = load i8** %arrayidx20, align 8
  %call21 = call i8* @m(i8* %24)
  store i8* %call21, i8** @u, align 8
  br label %if.end22

if.end22:                                         ; preds = %if.then18, %if.end11
  br label %if.end23

if.else:                                          ; preds = %land.lhs.true2, %land.lhs.true, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %if.end22
  br label %while.cond

while.cond:                                       ; preds = %if.end30, %if.end23
  %25 = load i32* @o, align 4
  %inc = add nsw i32 %25, 1
  store i32 %inc, i32* @o, align 4
  %26 = load i32* %argc.addr, align 4
  %cmp24 = icmp slt i32 %inc, %26
  br i1 %cmp24, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %27 = load i32* @o, align 4
  %idxprom25 = sext i32 %27 to i64
  %28 = load i8*** %argv.addr, align 8
  %arrayidx26 = getelementptr inbounds i8** %28, i64 %idxprom25
  %29 = load i8** %arrayidx26, align 8
  %call27 = call i32 @r(i8* %29)
  %cmp28 = icmp eq i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %while.body
  store i32 1, i32* %retval
  br label %return

if.end30:                                         ; preds = %while.body
  br label %while.cond

while.end:                                        ; preds = %while.cond
  store i32 0, i32* %retval
  br label %return

return:                                           ; preds = %while.end, %if.then29
  %30 = load i32* %retval
  ret i32 %30
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define i8* @s(i8* %v, i8** %pp) nounwind uwtable {
entry:
  %v.addr = alloca i8*, align 8
  %pp.addr = alloca i8**, align 8
  store i8* %v, i8** %v.addr, align 8
  store i8** %pp, i8*** %pp.addr, align 8
  %0 = load i8** %v.addr, align 8
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0)) nounwind readonly
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %1 = load i32* @check, align 4
  %inc = add nsw i32 %1, 1
  store i32 %inc, i32* @check, align 4
  %cmp1 = icmp sgt i32 %1, 1
  br i1 %cmp1, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  %2 = load i8** %v.addr, align 8
  %add.ptr = getelementptr inbounds i8* %2, i64 1
  %3 = load i8*** %pp.addr, align 8
  store i8* %add.ptr, i8** %3, align 8
  ret i8* null
}

define i8* @m(i8* %x) nounwind uwtable {
entry:
  %retval = alloca i8*, align 8
  %x.addr = alloca i8*, align 8
  store i8* %x, i8** %x.addr, align 8
  call void @abort() noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %0 = load i8** %retval
  ret i8* %0
}

define i32 @r(i8* %f) nounwind uwtable {
entry:
  %f.addr = alloca i8*, align 8
  store i8* %f, i8** %f.addr, align 8
  %0 = load i8** %f.addr, align 8
  %1 = load i8* %0, align 1
  %conv = sext i8 %1 to i32
  %2 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i32 0), align 1
  %conv1 = sext i8 %2 to i32
  %cmp = icmp ne i32 %conv, %conv1
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %3 = load i8** %f.addr, align 8
  %arrayidx = getelementptr inbounds i8* %3, i64 1
  %4 = load i8* %arrayidx, align 1
  %conv3 = sext i8 %4 to i32
  %5 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 1), align 1
  %conv4 = sext i8 %5 to i32
  %cmp5 = icmp ne i32 %conv3, %conv4
  br i1 %cmp5, label %if.then, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %lor.lhs.false
  %6 = load i32* @r.cnt, align 4
  %cmp8 = icmp sgt i32 %6, 3
  br i1 %cmp8, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false7, %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false7
  %7 = load i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 0), align 1
  %inc = add i8 %7, 1
  store i8 %inc, i8* getelementptr inbounds ([2 x i8]* @r.c, i32 0, i64 0), align 1
  %8 = load i32* @r.cnt, align 4
  %inc10 = add nsw i32 %8, 1
  store i32 %inc10, i32* @r.cnt, align 4
  ret i32 1
}

declare i32 @strcmp(i8*, i8*) nounwind readonly
