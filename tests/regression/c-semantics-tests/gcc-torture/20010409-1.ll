; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20010409-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.B = type { %struct.A**, i32 }
%struct.A = type { i32, i32 }

@b = global i32 1, align 4
@c = common global i32 0, align 4
@d = common global [1 x %struct.B] zeroinitializer, align 16
@.str = private unnamed_addr constant [5 x i8] c"test\00", align 1
@a = common global %struct.A* null, align 8
@.str1 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1

define void @foo(%struct.A* %x, i8* %y, i32 %z) nounwind uwtable {
entry:
  %x.addr = alloca %struct.A*, align 8
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i32, align 4
  store %struct.A* %x, %struct.A** %x.addr, align 8
  store i8* %y, i8** %y.addr, align 8
  store i32 %z, i32* %z.addr, align 4
  %0 = load i8** %y.addr, align 8
  %arrayidx = getelementptr inbounds i8* %0, i64 4
  %1 = load i8* %arrayidx, align 1
  %conv = sext i8 %1 to i32
  %2 = load i32* %z.addr, align 4
  %mul = mul nsw i32 %2, 25
  %add = add nsw i32 %conv, %mul
  store i32 %add, i32* @c, align 4
  ret void
}

define %struct.A* @bar(i8* %v, i32 %w, i32 %x, i8* %y, i32 %z) nounwind uwtable {
entry:
  %retval = alloca %struct.A*, align 8
  %v.addr = alloca i8*, align 8
  %w.addr = alloca i32, align 4
  %x.addr = alloca i32, align 4
  %y.addr = alloca i8*, align 8
  %z.addr = alloca i32, align 4
  store i8* %v, i8** %v.addr, align 8
  store i32 %w, i32* %w.addr, align 4
  store i32 %x, i32* %x.addr, align 4
  store i8* %y, i8** %y.addr, align 8
  store i32 %z, i32* %z.addr, align 4
  %0 = load i32* %w.addr, align 4
  %tobool = icmp ne i32 %0, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %1 = load %struct.A** %retval
  ret %struct.A* %1
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind

define void @test(i8* %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i32*, align 8
  store i8* %x, i8** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  %0 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom = sext i32 %0 to i64
  %1 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx = getelementptr inbounds %struct.A** %1, i64 %idxprom
  %2 = load %struct.A** %arrayidx, align 8
  call void @foo(%struct.A* %2, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 200)
  %3 = load i8** %x.addr, align 8
  %4 = load i32* @b, align 4
  %tobool = icmp ne i32 %4, 0
  %cond = select i1 %tobool, i32 0, i32 65536
  %5 = load i8** %x.addr, align 8
  %call = call i64 @strlen(i8* %5)
  %conv = trunc i64 %call to i32
  %call1 = call %struct.A* @bar(i8* %3, i32 %cond, i32 %conv, i8* getelementptr inbounds ([5 x i8]* @.str, i32 0, i32 0), i32 201)
  %6 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom2 = sext i32 %6 to i64
  %7 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx3 = getelementptr inbounds %struct.A** %7, i64 %idxprom2
  store %struct.A* %call1, %struct.A** %arrayidx3, align 8
  %8 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom4 = sext i32 %8 to i64
  %9 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx5 = getelementptr inbounds %struct.A** %9, i64 %idxprom4
  %10 = load %struct.A** %arrayidx5, align 8
  %a = getelementptr inbounds %struct.A* %10, i32 0, i32 0
  %11 = load i32* %a, align 4
  %inc = add nsw i32 %11, 1
  store i32 %inc, i32* %a, align 4
  %12 = load i32** %y.addr, align 8
  %tobool6 = icmp ne i32* %12, null
  br i1 %tobool6, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  %13 = load i32** %y.addr, align 8
  %14 = load i32* %13, align 4
  %15 = load i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  %idxprom7 = sext i32 %15 to i64
  %16 = load %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  %arrayidx8 = getelementptr inbounds %struct.A** %16, i64 %idxprom7
  %17 = load %struct.A** %arrayidx8, align 8
  %b = getelementptr inbounds %struct.A* %17, i32 0, i32 1
  store i32 %14, i32* %b, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %entry
  ret void
}

declare i64 @strlen(i8*)

define i32 @main() nounwind uwtable {
entry:
  store i32 0, i32* getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 1), align 4
  store %struct.A** @a, %struct.A*** getelementptr inbounds ([1 x %struct.B]* @d, i32 0, i32 0, i32 0), align 8
  call void @test(i8* getelementptr inbounds ([1 x i8]* @.str1, i32 0, i32 0), i32* null)
  ret i32 0
}
