; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20050502-2.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.x = internal unnamed_addr constant [11 x i8] c"IJKLMNOPQR\00", align 1
@.str = private unnamed_addr constant [11 x i8] c"IJKL\00NOPQR\00", align 1
@.str1 = private unnamed_addr constant [11 x i8] c"IJKLMNOP\00R\00", align 1

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

define void @foo(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp1 = load i32* %i, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %i, align 4
  %add = add nsw i32 %tmp2, %tmp3
  %idxprom = sext i32 %add to i64
  %tmp4 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp4, i64 %idxprom
  store i8 0, i8* %arrayidx
  ret void
}

define void @bar(i8* %x) nounwind uwtable {
entry:
  %x.addr = alloca i8*, align 8
  %i = alloca i32, align 4
  store i8* %x, i8** %x.addr, align 8
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp1 = load i32* %i, align 4
  %inc = add nsw i32 %tmp1, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  %tmp2 = load i32* %i, align 4
  %tmp3 = load i32* %i, align 4
  %add = add nsw i32 %tmp2, %tmp3
  %tmp4 = load i32* %i, align 4
  %add5 = add nsw i32 %add, %tmp4
  %tmp6 = load i32* %i, align 4
  %add7 = add nsw i32 %add5, %tmp6
  %idxprom = sext i32 %add7 to i64
  %tmp8 = load i8** %x.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp8, i64 %idxprom
  store i8 0, i8* %arrayidx
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %x = alloca [11 x i8], align 1
  store i32 0, i32* %retval
  %tmp = bitcast [11 x i8]* %x to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* getelementptr inbounds ([11 x i8]* @main.x, i32 0, i32 0), i64 11, i32 1, i1 false)
  %arraydecay = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @foo(i8* %arraydecay)
  %arraydecay1 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %call = call i32 @memcmp(i8* %arraydecay1, i8* getelementptr inbounds ([11 x i8]* @.str, i32 0, i32 0), i64 11)
  %cmp = icmp ne i32 %call, 0
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %arrayidx = getelementptr inbounds [11 x i8]* %x, i32 0, i64 4
  store i8 77, i8* %arrayidx, align 1
  %arraydecay2 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  call void @bar(i8* %arraydecay2)
  %arraydecay3 = getelementptr inbounds [11 x i8]* %x, i32 0, i32 0
  %call4 = call i32 @memcmp(i8* %arraydecay3, i8* getelementptr inbounds ([11 x i8]* @.str1, i32 0, i32 0), i64 11)
  %cmp5 = icmp ne i32 %call4, 0
  br i1 %cmp5, label %if.then6, label %if.end7

if.then6:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end7:                                          ; preds = %if.end
  ret i32 0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare i32 @memcmp(i8*, i8*, i64)

declare void @abort() noreturn nounwind
