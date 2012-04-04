; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr20601-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.T = type { i8*, [4096 x i8], i8** }

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.str1 = private unnamed_addr constant [3 x i8] c"-u\00", align 1
@.str2 = private unnamed_addr constant [2 x i8] c"b\00", align 1
@.str3 = private unnamed_addr constant [2 x i8] c"c\00", align 1
@g = global [4 x i8*] [i8* getelementptr inbounds ([2 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([3 x i8]* @.str1, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str2, i32 0, i32 0), i8* getelementptr inbounds ([2 x i8]* @.str3, i32 0, i32 0)], align 16
@c = common global i8** null, align 8
@b = common global i32 0, align 4
@.str4 = private unnamed_addr constant [8 x i8] c"/bin/sh\00", align 1
@t = common global %struct.T zeroinitializer, align 8
@a = common global [5 x i32] zeroinitializer, align 16
@d = common global i32 0, align 4
@e = common global i8** null, align 8
@f = common global [16 x i8*] zeroinitializer, align 16

define void @foo() noreturn nounwind uwtable {
entry:
  br label %while.body

while.body:                                       ; preds = %entry, %while.body
  br label %while.body

return:                                           ; No predecessors!
  ret void
}

define i8* @bar(i8* %x, i32 %y) nounwind uwtable noinline {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  ret i8* null
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca i32, align 4
  store i32 0, i32* %retval
  store i8** getelementptr inbounds ([4 x i8*]* @g, i32 0, i32 0), i8*** @c, align 8
  store i32 4, i32* @b, align 4
  %call = call i32 @setup2()
  store i32 %call, i32* %x, align 4
  store i8* getelementptr inbounds ([8 x i8]* @.str4, i32 0, i32 0), i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %0 = load i32* %x, align 4
  %call1 = call i32 @setup1(i32 %0)
  %1 = load i32* %x, align 4
  %and = and i32 %1, 1024
  %tobool = icmp ne i32 %and, 0
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i32* getelementptr inbounds ([5 x i32]* @a, i32 0, i64 4), align 4
  %tobool2 = icmp ne i32 %2, 0
  br i1 %tobool2, label %if.end, label %if.then

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %entry
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %3 = load i32* %retval
  ret i32 %3
}

define internal i32 @setup2() nounwind uwtable inlinehint {
entry:
  %retval = alloca i32, align 4
  %j = alloca i32, align 4
  store i32 1, i32* %j, align 4
  %0 = load i8*** @c, align 8
  %add.ptr = getelementptr inbounds i8** %0, i64 1
  store i8** %add.ptr, i8*** @e, align 8
  %1 = load i32* @b, align 4
  %sub = sub nsw i32 %1, 1
  store i32 %sub, i32* @d, align 4
  br label %while.cond

while.cond:                                       ; preds = %sw.epilog, %entry
  %2 = load i32* @d, align 4
  %cmp = icmp sgt i32 %2, 0
  br i1 %cmp, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %while.cond
  %3 = load i8*** @e, align 8
  %arrayidx = getelementptr inbounds i8** %3, i64 0
  %4 = load i8** %arrayidx, align 8
  %arrayidx1 = getelementptr inbounds i8* %4, i64 0
  %5 = load i8* %arrayidx1, align 1
  %conv = sext i8 %5 to i32
  %cmp2 = icmp eq i32 %conv, 45
  br label %land.end

land.end:                                         ; preds = %land.rhs, %while.cond
  %6 = phi i1 [ false, %while.cond ], [ %cmp2, %land.rhs ]
  br i1 %6, label %while.body, label %while.end

while.body:                                       ; preds = %land.end
  %7 = load i8*** @e, align 8
  %arrayidx4 = getelementptr inbounds i8** %7, i64 0
  %8 = load i8** %arrayidx4, align 8
  %arrayidx5 = getelementptr inbounds i8* %8, i64 1
  %9 = load i8* %arrayidx5, align 1
  %conv6 = sext i8 %9 to i32
  %cmp7 = icmp ne i32 %conv6, 0
  br i1 %cmp7, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %10 = load i8*** @e, align 8
  %arrayidx9 = getelementptr inbounds i8** %10, i64 0
  %11 = load i8** %arrayidx9, align 8
  %arrayidx10 = getelementptr inbounds i8* %11, i64 2
  %12 = load i8* %arrayidx10, align 1
  %conv11 = sext i8 %12 to i32
  %cmp12 = icmp ne i32 %conv11, 0
  br i1 %cmp12, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @abort() noreturn
  unreachable

if.end:                                           ; preds = %land.lhs.true, %while.body
  %13 = load i8*** @e, align 8
  %arrayidx14 = getelementptr inbounds i8** %13, i64 0
  %14 = load i8** %arrayidx14, align 8
  %arrayidx15 = getelementptr inbounds i8* %14, i64 1
  %15 = load i8* %arrayidx15, align 1
  %conv16 = sext i8 %15 to i32
  switch i32 %conv16, label %sw.epilog [
    i32 117, label %sw.bb
    i32 80, label %sw.bb21
    i32 45, label %sw.bb22
  ]

sw.bb:                                            ; preds = %if.end
  %16 = load i8*** @e, align 8
  %arrayidx17 = getelementptr inbounds i8** %16, i64 1
  %17 = load i8** %arrayidx17, align 8
  %tobool = icmp ne i8* %17, null
  br i1 %tobool, label %if.end19, label %if.then18

if.then18:                                        ; preds = %sw.bb
  call void @abort() noreturn
  unreachable

if.end19:                                         ; preds = %sw.bb
  %18 = load i8*** @e, align 8
  %arrayidx20 = getelementptr inbounds i8** %18, i64 1
  store i8** %arrayidx20, i8*** getelementptr inbounds (%struct.T* @t, i32 0, i32 2), align 8
  %19 = load i32* @d, align 4
  %dec = add nsw i32 %19, -1
  store i32 %dec, i32* @d, align 4
  %20 = load i8*** @e, align 8
  %incdec.ptr = getelementptr inbounds i8** %20, i32 1
  store i8** %incdec.ptr, i8*** @e, align 8
  br label %sw.epilog

sw.bb21:                                          ; preds = %if.end
  %21 = load i32* %j, align 4
  %or = or i32 %21, 4096
  store i32 %or, i32* %j, align 4
  br label %sw.epilog

sw.bb22:                                          ; preds = %if.end
  %22 = load i32* @d, align 4
  %dec23 = add nsw i32 %22, -1
  store i32 %dec23, i32* @d, align 4
  %23 = load i8*** @e, align 8
  %incdec.ptr24 = getelementptr inbounds i8** %23, i32 1
  store i8** %incdec.ptr24, i8*** @e, align 8
  %24 = load i32* %j, align 4
  %cmp25 = icmp eq i32 %24, 1
  br i1 %cmp25, label %if.then27, label %if.end29

if.then27:                                        ; preds = %sw.bb22
  %25 = load i32* %j, align 4
  %or28 = or i32 %25, 1536
  store i32 %or28, i32* %j, align 4
  br label %if.end29

if.end29:                                         ; preds = %if.then27, %sw.bb22
  %26 = load i32* %j, align 4
  store i32 %26, i32* %retval
  br label %return

sw.epilog:                                        ; preds = %if.end, %sw.bb21, %if.end19
  %27 = load i32* @d, align 4
  %dec30 = add nsw i32 %27, -1
  store i32 %dec30, i32* @d, align 4
  %28 = load i8*** @e, align 8
  %incdec.ptr31 = getelementptr inbounds i8** %28, i32 1
  store i8** %incdec.ptr31, i8*** @e, align 8
  br label %while.cond

while.end:                                        ; preds = %land.end
  %29 = load i32* @d, align 4
  %cmp32 = icmp sgt i32 %29, 0
  br i1 %cmp32, label %land.lhs.true34, label %if.end37

land.lhs.true34:                                  ; preds = %while.end
  %30 = load i32* %j, align 4
  %and = and i32 %30, 1
  %tobool35 = icmp ne i32 %and, 0
  br i1 %tobool35, label %if.end37, label %if.then36

if.then36:                                        ; preds = %land.lhs.true34
  call void @abort() noreturn
  unreachable

if.end37:                                         ; preds = %land.lhs.true34, %while.end
  %31 = load i32* %j, align 4
  store i32 %31, i32* %retval
  br label %return

return:                                           ; preds = %if.end37, %if.end29
  %32 = load i32* %retval
  ret i32 %32
}

define internal i32 @setup1(i32 %x) nounwind uwtable inlinehint {
entry:
  %x.addr = alloca i32, align 4
  %p = alloca i8*, align 8
  %rval = alloca i32, align 4
  %h = alloca i8**, align 8
  %i = alloca i8**, align 8
  store i32 %x, i32* %x.addr, align 4
  %call = call i8* @baz(i8* getelementptr inbounds (%struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  %tobool = icmp ne i8* %call, null
  br i1 %tobool, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  %call1 = call i8* @baz(i8* getelementptr inbounds (%struct.T* @t, i32 0, i32 1, i32 0), i32 4096)
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  %0 = load i32* %x.addr, align 4
  %and = and i32 %0, 512
  %tobool2 = icmp ne i32 %and, 0
  br i1 %tobool2, label %if.then3, label %if.end10

if.then3:                                         ; preds = %if.end
  %1 = load i8*** @e, align 8
  store i8** %1, i8*** %i, align 8
  %2 = load i32* @d, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* @d, align 4
  store i8** getelementptr inbounds ([16 x i8*]* @f, i32 0, i32 0), i8*** @e, align 8
  %3 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %tobool4 = icmp ne i8* %3, null
  br i1 %tobool4, label %land.lhs.true, label %if.else

land.lhs.true:                                    ; preds = %if.then3
  %4 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %5 = load i8* %4, align 1
  %conv = sext i8 %5 to i32
  %tobool5 = icmp ne i32 %conv, 0
  br i1 %tobool5, label %if.then6, label %if.else

if.then6:                                         ; preds = %land.lhs.true
  %6 = load i8** getelementptr inbounds (%struct.T* @t, i32 0, i32 0), align 8
  %7 = load i8*** @e, align 8
  %arrayidx = getelementptr inbounds i8** %7, i64 0
  store i8* %6, i8** %arrayidx, align 8
  br label %if.end7

if.else:                                          ; preds = %land.lhs.true, %if.then3
  call void @abort() noreturn
  unreachable

if.end7:                                          ; preds = %if.then6
  %8 = load i8*** @e, align 8
  %add.ptr = getelementptr inbounds i8** %8, i64 1
  store i8** %add.ptr, i8*** %h, align 8
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %if.end7
  %9 = load i8*** %i, align 8
  %10 = load i8** %9, align 8
  %11 = load i8*** %h, align 8
  store i8* %10, i8** %11, align 8
  %tobool8 = icmp ne i8* %10, null
  br i1 %tobool8, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %12 = load i8*** %i, align 8
  %incdec.ptr = getelementptr inbounds i8** %12, i32 1
  store i8** %incdec.ptr, i8*** %i, align 8
  %13 = load i8*** %h, align 8
  %incdec.ptr9 = getelementptr inbounds i8** %13, i32 1
  store i8** %incdec.ptr9, i8*** %h, align 8
  br label %for.cond

for.end:                                          ; preds = %for.cond
  br label %if.end10

if.end10:                                         ; preds = %for.end, %if.end
  ret i32 1
}

declare void @abort() noreturn

declare void @exit(i32) noreturn

define internal i8* @baz(i8* %x, i32 %y) nounwind uwtable inlinehint {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 %y, i32* %y.addr, align 4
  %0 = load i32* %y.addr, align 4
  %conv = zext i32 %0 to i64
  %cmp = icmp ugt i64 %conv, 4096
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @foo() noreturn
  unreachable

if.end:                                           ; preds = %entry
  %1 = load i8** %x.addr, align 8
  %2 = load i32* %y.addr, align 4
  %call = call i8* @bar(i8* %1, i32 %2)
  ret i8* %call
}
