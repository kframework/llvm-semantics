; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/950426-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.tag = type { i32, [5 x i8*] }

@s1 = common global %struct.tag zeroinitializer, align 8
@p1 = common global %struct.tag* null, align 8
@.str = private unnamed_addr constant [3 x i8] c"ok\00", align 1
@i = common global i32 0, align 4
@.str1 = private unnamed_addr constant [4 x i8] c"123\00", align 1

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 -1, i32* getelementptr inbounds (%struct.tag* @s1, i32 0, i32 0), align 4
  store %struct.tag* @s1, %struct.tag** @p1, align 8
  %0 = load %struct.tag** @p1, align 8
  %m1 = getelementptr inbounds %struct.tag* %0, i32 0, i32 0
  %call = call i32 (...)* bitcast (i32 (i32*)* @func1 to i32 (...)*)(i32* %m1)
  %cmp = icmp eq i32 %call, -1
  br i1 %cmp, label %if.then, label %if.else

if.then:                                          ; preds = %entry
  call void (...)* bitcast (void (i8*)* @foo to void (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %if.end

if.else:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %if.then
  store i32 3, i32* @i, align 4
  store i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0), i8** getelementptr inbounds (%struct.tag* @s1, i32 0, i32 1, i64 3), align 8
  %1 = load i32* @i, align 4
  %idxprom = sext i32 %1 to i64
  %2 = load %struct.tag** @p1, align 8
  %m2 = getelementptr inbounds %struct.tag* %2, i32 0, i32 1
  %arrayidx = getelementptr inbounds [5 x i8*]* %m2, i32 0, i64 %idxprom
  %3 = load i8** %arrayidx, align 8
  %incdec.ptr = getelementptr inbounds i8* %3, i32 1
  store i8* %incdec.ptr, i8** %arrayidx, align 8
  %call1 = call i64 @strlen(i8* %3) nounwind readonly
  %cmp2 = icmp eq i64 %call1, 3
  br i1 %cmp2, label %if.then3, label %if.else4

if.then3:                                         ; preds = %if.end
  call void (...)* bitcast (void (i8*)* @foo to void (...)*)(i8* getelementptr inbounds ([3 x i8]* @.str, i32 0, i32 0))
  br label %if.end5

if.else4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.then3
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %4 = load i32* %retval
  ret i32 %4
}

declare void @abort() noreturn nounwind

declare i64 @strlen(i8*) nounwind readonly

declare void @exit(i32) noreturn nounwind

define i32 @func1(i32* %p) nounwind uwtable {
entry:
  %p.addr = alloca i32*, align 8
  store i32* %p, i32** %p.addr, align 8
  %0 = load i32** %p.addr, align 8
  %1 = load i32* %0, align 4
  ret i32 %1
}

define void @foo(i8* %s) nounwind uwtable {
entry:
  %s.addr = alloca i8*, align 8
  store i8* %s, i8** %s.addr, align 8
  ret void
}
