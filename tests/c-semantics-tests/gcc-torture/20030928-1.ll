; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20030928-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [6 x i8] c"a1111\00", align 1
@.str1 = private unnamed_addr constant [6 x i8] c"a1112\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"a1113\00", align 1
@.str3 = private unnamed_addr constant [6 x i8] c"a1114\00", align 1
@.str4 = private unnamed_addr constant [6 x i8] c"a1115\00", align 1
@.str5 = private unnamed_addr constant [6 x i8] c"a1116\00", align 1
@.str6 = private unnamed_addr constant [6 x i8] c"a1117\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"a1118\00", align 1

define void @get_addrs(i8** %x, i32* %y) nounwind uwtable {
entry:
  %x.addr = alloca i8**, align 8
  %y.addr = alloca i32*, align 8
  store i8** %x, i8*** %x.addr, align 8
  store i32* %y, i32** %y.addr, align 8
  %0 = load i32** %y.addr, align 8
  %arrayidx = getelementptr inbounds i32* %0, i64 0
  %1 = load i32* %arrayidx, align 4
  %sub = sub nsw i32 %1, 65536
  %mul = mul nsw i32 %sub, 2
  %idx.ext = sext i32 %mul to i64
  %add.ptr = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str, i32 0, i32 0), i64 %idx.ext
  %2 = load i8*** %x.addr, align 8
  %arrayidx1 = getelementptr inbounds i8** %2, i64 0
  store i8* %add.ptr, i8** %arrayidx1, align 8
  %3 = load i32** %y.addr, align 8
  %arrayidx2 = getelementptr inbounds i32* %3, i64 1
  %4 = load i32* %arrayidx2, align 4
  %sub3 = sub nsw i32 %4, 131072
  %mul4 = mul nsw i32 %sub3, 2
  %idx.ext5 = sext i32 %mul4 to i64
  %add.ptr6 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str1, i32 0, i32 0), i64 %idx.ext5
  %5 = load i8*** %x.addr, align 8
  %arrayidx7 = getelementptr inbounds i8** %5, i64 1
  store i8* %add.ptr6, i8** %arrayidx7, align 8
  %6 = load i32** %y.addr, align 8
  %arrayidx8 = getelementptr inbounds i32* %6, i64 2
  %7 = load i32* %arrayidx8, align 4
  %sub9 = sub nsw i32 %7, 196608
  %mul10 = mul nsw i32 %sub9, 2
  %idx.ext11 = sext i32 %mul10 to i64
  %add.ptr12 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0), i64 %idx.ext11
  %8 = load i8*** %x.addr, align 8
  %arrayidx13 = getelementptr inbounds i8** %8, i64 2
  store i8* %add.ptr12, i8** %arrayidx13, align 8
  %9 = load i32** %y.addr, align 8
  %arrayidx14 = getelementptr inbounds i32* %9, i64 3
  %10 = load i32* %arrayidx14, align 4
  %sub15 = sub nsw i32 %10, 262144
  %mul16 = mul nsw i32 %sub15, 2
  %idx.ext17 = sext i32 %mul16 to i64
  %add.ptr18 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str3, i32 0, i32 0), i64 %idx.ext17
  %11 = load i8*** %x.addr, align 8
  %arrayidx19 = getelementptr inbounds i8** %11, i64 3
  store i8* %add.ptr18, i8** %arrayidx19, align 8
  %12 = load i32** %y.addr, align 8
  %arrayidx20 = getelementptr inbounds i32* %12, i64 4
  %13 = load i32* %arrayidx20, align 4
  %sub21 = sub nsw i32 %13, 327680
  %mul22 = mul nsw i32 %sub21, 2
  %idx.ext23 = sext i32 %mul22 to i64
  %add.ptr24 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str4, i32 0, i32 0), i64 %idx.ext23
  %14 = load i8*** %x.addr, align 8
  %arrayidx25 = getelementptr inbounds i8** %14, i64 4
  store i8* %add.ptr24, i8** %arrayidx25, align 8
  %15 = load i32** %y.addr, align 8
  %arrayidx26 = getelementptr inbounds i32* %15, i64 5
  %16 = load i32* %arrayidx26, align 4
  %sub27 = sub nsw i32 %16, 393216
  %mul28 = mul nsw i32 %sub27, 2
  %idx.ext29 = sext i32 %mul28 to i64
  %add.ptr30 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str5, i32 0, i32 0), i64 %idx.ext29
  %17 = load i8*** %x.addr, align 8
  %arrayidx31 = getelementptr inbounds i8** %17, i64 5
  store i8* %add.ptr30, i8** %arrayidx31, align 8
  %18 = load i32** %y.addr, align 8
  %arrayidx32 = getelementptr inbounds i32* %18, i64 6
  %19 = load i32* %arrayidx32, align 4
  %sub33 = sub nsw i32 %19, 458752
  %mul34 = mul nsw i32 %sub33, 2
  %idx.ext35 = sext i32 %mul34 to i64
  %add.ptr36 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str6, i32 0, i32 0), i64 %idx.ext35
  %20 = load i8*** %x.addr, align 8
  %arrayidx37 = getelementptr inbounds i8** %20, i64 6
  store i8* %add.ptr36, i8** %arrayidx37, align 8
  %21 = load i32** %y.addr, align 8
  %arrayidx38 = getelementptr inbounds i32* %21, i64 7
  %22 = load i32* %arrayidx38, align 4
  %sub39 = sub nsw i32 %22, 524288
  %mul40 = mul nsw i32 %sub39, 2
  %idx.ext41 = sext i32 %mul40 to i64
  %add.ptr42 = getelementptr inbounds i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0), i64 %idx.ext41
  %23 = load i8*** %x.addr, align 8
  %arrayidx43 = getelementptr inbounds i8** %23, i64 7
  store i8* %add.ptr42, i8** %arrayidx43, align 8
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [8 x i8*], align 16
  %y = alloca [8 x i32], align 16
  %i = alloca i32, align 4
  store i32 0, i32* %retval
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %0 = load i32* %i, align 4
  %cmp = icmp slt i32 %0, 8
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %1 = load i32* %i, align 4
  %add = add nsw i32 %1, 1
  %mul = mul nsw i32 65536, %add
  %2 = load i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %arrayidx = getelementptr inbounds [8 x i32]* %y, i32 0, i64 %idxprom
  store i32 %mul, i32* %arrayidx, align 4
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %3 = load i32* %i, align 4
  %inc = add nsw i32 %3, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %arraydecay = getelementptr inbounds [8 x i8*]* %x, i32 0, i32 0
  %arraydecay1 = getelementptr inbounds [8 x i32]* %y, i32 0, i32 0
  call void @get_addrs(i8** %arraydecay, i32* %arraydecay1)
  store i32 0, i32* %i, align 4
  br label %for.cond2

for.cond2:                                        ; preds = %for.inc9, %for.end
  %4 = load i32* %i, align 4
  %cmp3 = icmp slt i32 %4, 8
  br i1 %cmp3, label %for.body4, label %for.end11

for.body4:                                        ; preds = %for.cond2
  %5 = load i32* %i, align 4
  %idxprom5 = sext i32 %5 to i64
  %arrayidx6 = getelementptr inbounds [8 x i8*]* %x, i32 0, i64 %idxprom5
  %6 = load i8** %arrayidx6, align 8
  %7 = load i8* %6, align 1
  %conv = sext i8 %7 to i32
  %cmp7 = icmp ne i32 %conv, 97
  br i1 %cmp7, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body4
  br label %for.inc9

for.inc9:                                         ; preds = %if.end
  %8 = load i32* %i, align 4
  %inc10 = add nsw i32 %8, 1
  store i32 %inc10, i32* %i, align 4
  br label %for.cond2

for.end11:                                        ; preds = %for.cond2
  call void @exit(i32 0) noreturn nounwind
  unreachable

return:                                           ; No predecessors!
  %9 = load i32* %retval
  ret i32 %9
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
