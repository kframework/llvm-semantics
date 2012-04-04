; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20050502-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"abcde'fgh\00", align 1
@.str1 = private unnamed_addr constant [4 x i8] c"fgh\00", align 1
@.str2 = private unnamed_addr constant [6 x i8] c"abcde\00", align 1
@.str3 = private unnamed_addr constant [11 x i8] c"ABCDEFG\22HI\00", align 1
@.str4 = private unnamed_addr constant [3 x i8] c"HI\00", align 1
@.str5 = private unnamed_addr constant [8 x i8] c"ABCDEFG\00", align 1
@.str6 = private unnamed_addr constant [11 x i8] c"abcd\22e'fgh\00", align 1
@.str7 = private unnamed_addr constant [6 x i8] c"e'fgh\00", align 1
@.str8 = private unnamed_addr constant [5 x i8] c"abcd\00", align 1
@.str9 = private unnamed_addr constant [12 x i8] c"ABCDEF'G\22HI\00", align 1
@.str10 = private unnamed_addr constant [5 x i8] c"G\22HI\00", align 1
@.str11 = private unnamed_addr constant [7 x i8] c"ABCDEF\00", align 1
@.str12 = private unnamed_addr constant [10 x i8] c"abcdef@gh\00", align 1
@.str13 = private unnamed_addr constant [3 x i8] c"gh\00", align 1
@.str14 = private unnamed_addr constant [7 x i8] c"abcdef\00", align 1

define i32 @bar(i8** %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i8**, align 8
  store i8** %x, i8*** %x.addr, align 8
  %0 = load i8*** %x.addr, align 8
  %1 = load i8** %0, align 8
  %incdec.ptr = getelementptr inbounds i8* %1, i32 1
  store i8* %incdec.ptr, i8** %0, align 8
  %2 = load i8* %1, align 1
  %conv = sext i8 %2 to i32
  ret i32 %conv
}

define i32 @baz(i32 %c) nounwind uwtable noinline {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %0 = load i32* %c.addr, align 4
  %cmp = icmp ne i32 %0, 64
  %conv = zext i1 %cmp to i32
  ret i32 %conv
}

define void @foo(i8** %w, i8* %x, i1 zeroext %y, i1 zeroext %z) nounwind uwtable noinline {
entry:
  %w.addr = alloca i8**, align 8
  %x.addr = alloca i8*, align 8
  %y.addr = alloca i8, align 1
  %z.addr = alloca i8, align 1
  %c = alloca i8, align 1
  %i = alloca i32, align 4
  store i8** %w, i8*** %w.addr, align 8
  store i8* %x, i8** %x.addr, align 8
  %frombool = zext i1 %y to i8
  store i8 %frombool, i8* %y.addr, align 1
  %frombool1 = zext i1 %z to i8
  store i8 %frombool1, i8* %z.addr, align 1
  %0 = load i8*** %w.addr, align 8
  %call = call i32 @bar(i8** %0)
  %conv = trunc i32 %call to i8
  store i8 %conv, i8* %c, align 1
  store i32 0, i32* %i, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end23
  %1 = load i8* %c, align 1
  %2 = load i32* %i, align 4
  %inc = add nsw i32 %2, 1
  store i32 %inc, i32* %i, align 4
  %idxprom = sext i32 %2 to i64
  %3 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %3, i64 %idxprom
  store i8 %1, i8* %arrayidx, align 1
  %4 = load i8*** %w.addr, align 8
  %call2 = call i32 @bar(i8** %4)
  %conv3 = trunc i32 %call2 to i8
  store i8 %conv3, i8* %c, align 1
  %5 = load i8* %y.addr, align 1
  %tobool = trunc i8 %5 to i1
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %6 = load i8* %c, align 1
  %conv5 = sext i8 %6 to i32
  %cmp = icmp eq i32 %conv5, 39
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %while.end

if.end:                                           ; preds = %land.lhs.true, %while.body
  %7 = load i8* %z.addr, align 1
  %tobool7 = trunc i8 %7 to i1
  br i1 %tobool7, label %land.lhs.true9, label %if.end14

land.lhs.true9:                                   ; preds = %if.end
  %8 = load i8* %c, align 1
  %conv10 = sext i8 %8 to i32
  %cmp11 = icmp eq i32 %conv10, 34
  br i1 %cmp11, label %if.then13, label %if.end14

if.then13:                                        ; preds = %land.lhs.true9
  br label %while.end

if.end14:                                         ; preds = %land.lhs.true9, %if.end
  %9 = load i8* %y.addr, align 1
  %tobool15 = trunc i8 %9 to i1
  br i1 %tobool15, label %if.end23, label %land.lhs.true16

land.lhs.true16:                                  ; preds = %if.end14
  %10 = load i8* %z.addr, align 1
  %tobool17 = trunc i8 %10 to i1
  br i1 %tobool17, label %if.end23, label %land.lhs.true18

land.lhs.true18:                                  ; preds = %land.lhs.true16
  %11 = load i8* %c, align 1
  %conv19 = sext i8 %11 to i32
  %call20 = call i32 @baz(i32 %conv19)
  %tobool21 = icmp ne i32 %call20, 0
  br i1 %tobool21, label %if.end23, label %if.then22

if.then22:                                        ; preds = %land.lhs.true18
  br label %while.end

if.end23:                                         ; preds = %land.lhs.true18, %land.lhs.true16, %if.end14
  br label %while.body

while.end:                                        ; preds = %if.then22, %if.then13, %if.then
  %12 = load i32* %i, align 4
  %idxprom24 = sext i32 %12 to i64
  %13 = load i8** %x.addr, align 8
  %arrayidx25 = getelementptr inbounds i8* %13, i64 %idxprom24
  store i8 0, i8* %arrayidx25, align 1
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %buf = alloca [64 x i8], align 16
  %p = alloca i8*, align 8
  store i32 0, i32* %retval
  store i8* getelementptr inbounds ([10 x i8]* @.str, i32 0, i32 0), i8** %p, align 8
  %arraydecay = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay, i1 zeroext true, i1 zeroext false)
  %0 = load i8** %p, align 8
  %call = call i32 @strcmp(i8* %0, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %entry
  %arraydecay1 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call2 = call i32 @strcmp(i8* %arraydecay1, i8* getelementptr inbounds ([6 x i8]* @.str2, i32 0, i32 0))
  %cmp3 = icmp ne i32 %call2, 0
  br i1 %cmp3, label %if.then, label %if.end

if.then:                                          ; preds = %lor.lhs.false, %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %lor.lhs.false
  store i8* getelementptr inbounds ([11 x i8]* @.str3, i32 0, i32 0), i8** %p, align 8
  %arraydecay4 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay4, i1 zeroext false, i1 zeroext true)
  %1 = load i8** %p, align 8
  %call5 = call i32 @strcmp(i8* %1, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %cmp6 = icmp ne i32 %call5, 0
  br i1 %cmp6, label %if.then11, label %lor.lhs.false7

lor.lhs.false7:                                   ; preds = %if.end
  %arraydecay8 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call9 = call i32 @strcmp(i8* %arraydecay8, i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0))
  %cmp10 = icmp ne i32 %call9, 0
  br i1 %cmp10, label %if.then11, label %if.end12

if.then11:                                        ; preds = %lor.lhs.false7, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end12:                                         ; preds = %lor.lhs.false7
  store i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i8** %p, align 8
  %arraydecay13 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay13, i1 zeroext true, i1 zeroext true)
  %2 = load i8** %p, align 8
  %call14 = call i32 @strcmp(i8* %2, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0))
  %cmp15 = icmp ne i32 %call14, 0
  br i1 %cmp15, label %if.then20, label %lor.lhs.false16

lor.lhs.false16:                                  ; preds = %if.end12
  %arraydecay17 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call18 = call i32 @strcmp(i8* %arraydecay17, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0))
  %cmp19 = icmp ne i32 %call18, 0
  br i1 %cmp19, label %if.then20, label %if.end21

if.then20:                                        ; preds = %lor.lhs.false16, %if.end12
  call void @abort() noreturn nounwind
  unreachable

if.end21:                                         ; preds = %lor.lhs.false16
  store i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8** %p, align 8
  %arraydecay22 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay22, i1 zeroext true, i1 zeroext true)
  %3 = load i8** %p, align 8
  %call23 = call i32 @strcmp(i8* %3, i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %cmp24 = icmp ne i32 %call23, 0
  br i1 %cmp24, label %if.then29, label %lor.lhs.false25

lor.lhs.false25:                                  ; preds = %if.end21
  %arraydecay26 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call27 = call i32 @strcmp(i8* %arraydecay26, i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0))
  %cmp28 = icmp ne i32 %call27, 0
  br i1 %cmp28, label %if.then29, label %if.end30

if.then29:                                        ; preds = %lor.lhs.false25, %if.end21
  call void @abort() noreturn nounwind
  unreachable

if.end30:                                         ; preds = %lor.lhs.false25
  store i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0), i8** %p, align 8
  %arraydecay31 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay31, i1 zeroext false, i1 zeroext false)
  %4 = load i8** %p, align 8
  %call32 = call i32 @strcmp(i8* %4, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0))
  %cmp33 = icmp ne i32 %call32, 0
  br i1 %cmp33, label %if.then38, label %lor.lhs.false34

lor.lhs.false34:                                  ; preds = %if.end30
  %arraydecay35 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call36 = call i32 @strcmp(i8* %arraydecay35, i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %cmp37 = icmp ne i32 %call36, 0
  br i1 %cmp37, label %if.then38, label %if.end39

if.then38:                                        ; preds = %lor.lhs.false34, %if.end30
  call void @abort() noreturn nounwind
  unreachable

if.end39:                                         ; preds = %lor.lhs.false34
  ret i32 0
}

declare i32 @strcmp(i8*, i8*)

declare void @abort() noreturn nounwind
