; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/base64.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@b64 = global [65 x i8] c"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/\00", align 16
@nbytes = global [4 x i32] [i32 3, i32 1, i32 1, i32 2], align 16
@.str = private unnamed_addr constant [25 x i8] c"TGl0ZXJhdGVQcm9ncmFtcw==\00", align 1

define void @xlate(i8* %in, i32 %phase) nounwind uwtable {
entry:
  %in.addr = alloca i8*, align 8
  %phase.addr = alloca i32, align 4
  %out = alloca [3 x i8], align 1
  %i = alloca i32, align 4
  store i8* %in, i8** %in.addr, align 8
  store i32 %phase, i32* %phase.addr, align 4
  %tmp = load i8** %in.addr, align 8
  %arrayidx = getelementptr inbounds i8* %tmp, i64 0
  %tmp1 = load i8* %arrayidx
  %conv = zext i8 %tmp1 to i32
  %shl = shl i32 %conv, 2
  %tmp2 = load i8** %in.addr, align 8
  %arrayidx3 = getelementptr inbounds i8* %tmp2, i64 1
  %tmp4 = load i8* %arrayidx3
  %conv5 = zext i8 %tmp4 to i32
  %shr = ashr i32 %conv5, 4
  %or = or i32 %shl, %shr
  %conv6 = trunc i32 %or to i8
  %arrayidx7 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 0
  store i8 %conv6, i8* %arrayidx7, align 1
  %tmp8 = load i8** %in.addr, align 8
  %arrayidx9 = getelementptr inbounds i8* %tmp8, i64 1
  %tmp10 = load i8* %arrayidx9
  %conv11 = zext i8 %tmp10 to i32
  %shl12 = shl i32 %conv11, 4
  %tmp13 = load i8** %in.addr, align 8
  %arrayidx14 = getelementptr inbounds i8* %tmp13, i64 2
  %tmp15 = load i8* %arrayidx14
  %conv16 = zext i8 %tmp15 to i32
  %shr17 = ashr i32 %conv16, 2
  %or18 = or i32 %shl12, %shr17
  %conv19 = trunc i32 %or18 to i8
  %arrayidx20 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 1
  store i8 %conv19, i8* %arrayidx20, align 1
  %tmp21 = load i8** %in.addr, align 8
  %arrayidx22 = getelementptr inbounds i8* %tmp21, i64 2
  %tmp23 = load i8* %arrayidx22
  %conv24 = zext i8 %tmp23 to i32
  %shl25 = shl i32 %conv24, 6
  %tmp26 = load i8** %in.addr, align 8
  %arrayidx27 = getelementptr inbounds i8* %tmp26, i64 3
  %tmp28 = load i8* %arrayidx27
  %conv29 = zext i8 %tmp28 to i32
  %shr30 = ashr i32 %conv29, 0
  %or31 = or i32 %shl25, %shr30
  %conv32 = trunc i32 %or31 to i8
  %arrayidx33 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 2
  store i8 %conv32, i8* %arrayidx33, align 1
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp35 = load i32* %i, align 4
  %tmp36 = load i32* %phase.addr, align 4
  %idxprom = sext i32 %tmp36 to i64
  %arrayidx37 = getelementptr inbounds [4 x i32]* @nbytes, i32 0, i64 %idxprom
  %tmp38 = load i32* %arrayidx37, align 4
  %cmp = icmp slt i32 %tmp35, %tmp38
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp40 = load i32* %i, align 4
  %idxprom41 = sext i32 %tmp40 to i64
  %arrayidx42 = getelementptr inbounds [3 x i8]* %out, i32 0, i64 %idxprom41
  %tmp43 = load i8* %arrayidx42, align 1
  %conv44 = zext i8 %tmp43 to i32
  %call = call i32 @putchar(i32 %conv44)
  br label %for.inc

for.inc:                                          ; preds = %for.body
  %tmp45 = load i32* %i, align 4
  %inc = add nsw i32 %tmp45, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  ret void
}

declare i32 @putchar(i32)

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %c = alloca i32, align 4
  %phase = alloca i32, align 4
  %in = alloca [4 x i8], align 1
  %p = alloca i8*, align 8
  %input = alloca i8*, align 8
  store i32 0, i32* %retval
  store i32 0, i32* %phase, align 4
  store i8* getelementptr inbounds ([25 x i8]* @.str, i32 0, i32 0), i8** %input, align 8
  br label %while.cond

while.cond:                                       ; preds = %if.end25, %entry
  %tmp = load i8** %input, align 8
  %incdec.ptr = getelementptr inbounds i8* %tmp, i32 1
  store i8* %incdec.ptr, i8** %input, align 8
  %tmp1 = load i8* %tmp
  %conv = sext i8 %tmp1 to i32
  store i32 %conv, i32* %c, align 4
  %cmp = icmp ne i32 %conv, 0
  br i1 %cmp, label %while.body, label %while.end

while.body:                                       ; preds = %while.cond
  %tmp3 = load i32* %c, align 4
  %cmp4 = icmp eq i32 %tmp3, 61
  br i1 %cmp4, label %if.then, label %if.end

if.then:                                          ; preds = %while.body
  %arraydecay = getelementptr inbounds [4 x i8]* %in, i32 0, i32 0
  %tmp6 = load i32* %phase, align 4
  call void @xlate(i8* %arraydecay, i32 %tmp6)
  br label %while.end

if.end:                                           ; preds = %while.body
  %tmp7 = load i32* %c, align 4
  %call = call i8* @strchr(i8* getelementptr inbounds ([65 x i8]* @b64, i32 0, i32 0), i32 %tmp7) nounwind readonly
  store i8* %call, i8** %p, align 8
  %tmp8 = load i8** %p, align 8
  %tobool = icmp ne i8* %tmp8, null
  br i1 %tobool, label %if.then9, label %if.end25

if.then9:                                         ; preds = %if.end
  %tmp10 = load i8** %p, align 8
  %sub.ptr.lhs.cast = ptrtoint i8* %tmp10 to i64
  %sub.ptr.sub = sub i64 %sub.ptr.lhs.cast, ptrtoint ([65 x i8]* @b64 to i64)
  %conv11 = trunc i64 %sub.ptr.sub to i8
  %tmp12 = load i32* %phase, align 4
  %idxprom = sext i32 %tmp12 to i64
  %arrayidx = getelementptr inbounds [4 x i8]* %in, i32 0, i64 %idxprom
  store i8 %conv11, i8* %arrayidx, align 1
  %tmp13 = load i32* %phase, align 4
  %add = add nsw i32 %tmp13, 1
  %rem = srem i32 %add, 4
  store i32 %rem, i32* %phase, align 4
  %tmp14 = load i32* %phase, align 4
  %cmp15 = icmp eq i32 %tmp14, 0
  br i1 %cmp15, label %if.then17, label %if.end24

if.then17:                                        ; preds = %if.then9
  %arraydecay18 = getelementptr inbounds [4 x i8]* %in, i32 0, i32 0
  %tmp19 = load i32* %phase, align 4
  call void @xlate(i8* %arraydecay18, i32 %tmp19)
  %arrayidx20 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 3
  store i8 0, i8* %arrayidx20, align 1
  %arrayidx21 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 2
  store i8 0, i8* %arrayidx21, align 1
  %arrayidx22 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 1
  store i8 0, i8* %arrayidx22, align 1
  %arrayidx23 = getelementptr inbounds [4 x i8]* %in, i32 0, i64 0
  store i8 0, i8* %arrayidx23, align 1
  br label %if.end24

if.end24:                                         ; preds = %if.then17, %if.then9
  br label %if.end25

if.end25:                                         ; preds = %if.end24, %if.end
  br label %while.cond

while.end:                                        ; preds = %if.then, %while.cond
  ret i32 0
}

declare i8* @strchr(i8*, i32) nounwind readonly
