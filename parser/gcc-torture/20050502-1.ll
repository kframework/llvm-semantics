; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050502-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
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

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp, 8
  %and = and i64 %shr, 4095
  %tmp1 = load i64* %__dev.addr, align 8
  %shr2 = lshr i64 %tmp1, 32
  %conv = trunc i64 %shr2 to i32
  %and3 = and i32 %conv, -4096
  %conv4 = zext i32 %and3 to i64
  %or = or i64 %and, %conv4
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable inlinehint {
entry:
  %__dev.addr = alloca i64, align 8
  store i64 %__dev, i64* %__dev.addr, align 8
  %tmp = load i64* %__dev.addr, align 8
  %and = and i64 %tmp, 255
  %tmp1 = load i64* %__dev.addr, align 8
  %shr = lshr i64 %tmp1, 12
  %conv = trunc i64 %shr to i32
  %and2 = and i32 %conv, -256
  %conv3 = zext i32 %and2 to i64
  %or = or i64 %and, %conv3
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable inlinehint {
entry:
  %__major.addr = alloca i32, align 4
  %__minor.addr = alloca i32, align 4
  store i32 %__major, i32* %__major.addr, align 4
  store i32 %__minor, i32* %__minor.addr, align 4
  %tmp = load i32* %__minor.addr, align 4
  %and = and i32 %tmp, 255
  %tmp1 = load i32* %__major.addr, align 4
  %and2 = and i32 %tmp1, 4095
  %shl = shl i32 %and2, 8
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %tmp3 = load i32* %__minor.addr, align 4
  %and4 = and i32 %tmp3, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl i64 %conv5, 12
  %or7 = or i64 %conv, %shl6
  %tmp8 = load i32* %__major.addr, align 4
  %and9 = and i32 %tmp8, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl i64 %conv10, 32
  %or12 = or i64 %or7, %shl11
  ret i64 %or12
}

define i32 @bar(i8** %x) nounwind uwtable noinline {
entry:
  %x.addr = alloca i8**, align 8
  store i8** %x, i8*** %x.addr, align 8
  %tmp = load i8*** %x.addr, align 8
  %tmp1 = load i8** %tmp
  %incdec.ptr = getelementptr inbounds i8* %tmp1, i32 1
  store i8* %incdec.ptr, i8** %tmp
  %tmp2 = load i8* %tmp1
  %conv = sext i8 %tmp2 to i32
  ret i32 %conv
}

define i32 @baz(i32 %c) nounwind uwtable noinline {
entry:
  %c.addr = alloca i32, align 4
  store i32 %c, i32* %c.addr, align 4
  %tmp = load i32* %c.addr, align 4
  %cmp = icmp ne i32 %tmp, 64
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
  %tmp = load i8*** %w.addr, align 8
  %call = call i32 @bar(i8** %tmp)
  %conv = trunc i32 %call to i8
  store i8 %conv, i8* %c, align 1
  store i32 0, i32* %i, align 4
  br label %while.body

while.body:                                       ; preds = %entry, %if.end35
  %tmp3 = load i8* %c, align 1
  %tmp4 = load i32* %i, align 4
  %inc = add nsw i32 %tmp4, 1
  store i32 %inc, i32* %i, align 4
  %idxprom = sext i32 %tmp4 to i64
  %tmp5 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp5, i64 %idxprom
  store i8 %tmp3, i8* %arrayidx
  %tmp6 = load i8*** %w.addr, align 8
  %call7 = call i32 @bar(i8** %tmp6)
  %conv8 = trunc i32 %call7 to i8
  store i8 %conv8, i8* %c, align 1
  %tmp9 = load i8* %y.addr, align 1
  %tobool = trunc i8 %tmp9 to i1
  br i1 %tobool, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %while.body
  %tmp11 = load i8* %c, align 1
  %conv12 = sext i8 %tmp11 to i32
  %cmp = icmp eq i32 %conv12, 39
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  br label %while.end

if.end:                                           ; preds = %land.lhs.true, %while.body
  %tmp14 = load i8* %z.addr, align 1
  %tobool15 = trunc i8 %tmp14 to i1
  br i1 %tobool15, label %land.lhs.true17, label %if.end23

land.lhs.true17:                                  ; preds = %if.end
  %tmp18 = load i8* %c, align 1
  %conv19 = sext i8 %tmp18 to i32
  %cmp20 = icmp eq i32 %conv19, 34
  br i1 %cmp20, label %if.then22, label %if.end23

if.then22:                                        ; preds = %land.lhs.true17
  br label %while.end

if.end23:                                         ; preds = %land.lhs.true17, %if.end
  %tmp24 = load i8* %y.addr, align 1
  %tobool25 = trunc i8 %tmp24 to i1
  br i1 %tobool25, label %if.end35, label %land.lhs.true26

land.lhs.true26:                                  ; preds = %if.end23
  %tmp27 = load i8* %z.addr, align 1
  %tobool28 = trunc i8 %tmp27 to i1
  br i1 %tobool28, label %if.end35, label %land.lhs.true29

land.lhs.true29:                                  ; preds = %land.lhs.true26
  %tmp30 = load i8* %c, align 1
  %conv31 = sext i8 %tmp30 to i32
  %call32 = call i32 @baz(i32 %conv31)
  %tobool33 = icmp ne i32 %call32, 0
  br i1 %tobool33, label %if.end35, label %if.then34

if.then34:                                        ; preds = %land.lhs.true29
  br label %while.end

if.end35:                                         ; preds = %land.lhs.true29, %land.lhs.true26, %if.end23
  br label %while.body

while.end:                                        ; preds = %if.then34, %if.then22, %if.then
  %tmp36 = load i32* %i, align 4
  %idxprom37 = sext i32 %tmp36 to i64
  %tmp38 = load i8** %x.addr, align 8
  %arrayidx39 = getelementptr inbounds i8* %tmp38, i64 %idxprom37
  store i8 0, i8* %arrayidx39
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
  %tmp = load i8** %p, align 8
  %call = call i32 @strcmp(i8* %tmp, i8* getelementptr inbounds ([4 x i8]* @.str1, i32 0, i32 0))
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
  %tmp5 = load i8** %p, align 8
  %call6 = call i32 @strcmp(i8* %tmp5, i8* getelementptr inbounds ([3 x i8]* @.str4, i32 0, i32 0))
  %cmp7 = icmp ne i32 %call6, 0
  br i1 %cmp7, label %if.then12, label %lor.lhs.false8

lor.lhs.false8:                                   ; preds = %if.end
  %arraydecay9 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call10 = call i32 @strcmp(i8* %arraydecay9, i8* getelementptr inbounds ([8 x i8]* @.str5, i32 0, i32 0))
  %cmp11 = icmp ne i32 %call10, 0
  br i1 %cmp11, label %if.then12, label %if.end13

if.then12:                                        ; preds = %lor.lhs.false8, %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end13:                                         ; preds = %lor.lhs.false8
  store i8* getelementptr inbounds ([11 x i8]* @.str6, i32 0, i32 0), i8** %p, align 8
  %arraydecay14 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay14, i1 zeroext true, i1 zeroext true)
  %tmp15 = load i8** %p, align 8
  %call16 = call i32 @strcmp(i8* %tmp15, i8* getelementptr inbounds ([6 x i8]* @.str7, i32 0, i32 0))
  %cmp17 = icmp ne i32 %call16, 0
  br i1 %cmp17, label %if.then22, label %lor.lhs.false18

lor.lhs.false18:                                  ; preds = %if.end13
  %arraydecay19 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call20 = call i32 @strcmp(i8* %arraydecay19, i8* getelementptr inbounds ([5 x i8]* @.str8, i32 0, i32 0))
  %cmp21 = icmp ne i32 %call20, 0
  br i1 %cmp21, label %if.then22, label %if.end23

if.then22:                                        ; preds = %lor.lhs.false18, %if.end13
  call void @abort() noreturn nounwind
  unreachable

if.end23:                                         ; preds = %lor.lhs.false18
  store i8* getelementptr inbounds ([12 x i8]* @.str9, i32 0, i32 0), i8** %p, align 8
  %arraydecay24 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay24, i1 zeroext true, i1 zeroext true)
  %tmp25 = load i8** %p, align 8
  %call26 = call i32 @strcmp(i8* %tmp25, i8* getelementptr inbounds ([5 x i8]* @.str10, i32 0, i32 0))
  %cmp27 = icmp ne i32 %call26, 0
  br i1 %cmp27, label %if.then32, label %lor.lhs.false28

lor.lhs.false28:                                  ; preds = %if.end23
  %arraydecay29 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call30 = call i32 @strcmp(i8* %arraydecay29, i8* getelementptr inbounds ([7 x i8]* @.str11, i32 0, i32 0))
  %cmp31 = icmp ne i32 %call30, 0
  br i1 %cmp31, label %if.then32, label %if.end33

if.then32:                                        ; preds = %lor.lhs.false28, %if.end23
  call void @abort() noreturn nounwind
  unreachable

if.end33:                                         ; preds = %lor.lhs.false28
  store i8* getelementptr inbounds ([10 x i8]* @.str12, i32 0, i32 0), i8** %p, align 8
  %arraydecay34 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  call void @foo(i8** %p, i8* %arraydecay34, i1 zeroext false, i1 zeroext false)
  %tmp35 = load i8** %p, align 8
  %call36 = call i32 @strcmp(i8* %tmp35, i8* getelementptr inbounds ([3 x i8]* @.str13, i32 0, i32 0))
  %cmp37 = icmp ne i32 %call36, 0
  br i1 %cmp37, label %if.then42, label %lor.lhs.false38

lor.lhs.false38:                                  ; preds = %if.end33
  %arraydecay39 = getelementptr inbounds [64 x i8]* %buf, i32 0, i32 0
  %call40 = call i32 @strcmp(i8* %arraydecay39, i8* getelementptr inbounds ([7 x i8]* @.str14, i32 0, i32 0))
  %cmp41 = icmp ne i32 %call40, 0
  br i1 %cmp41, label %if.then42, label %if.end43

if.then42:                                        ; preds = %lor.lhs.false38, %if.end33
  call void @abort() noreturn nounwind
  unreachable

if.end43:                                         ; preds = %lor.lhs.false38
  ret i32 0
}

declare i32 @strcmp(i8*, i8*)

declare void @abort() noreturn nounwind
