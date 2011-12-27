; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@main.listElem = internal unnamed_addr constant [4 x i32] [i32 30, i32 2, i32 10, i32 5], align 16

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %listElem = alloca [4 x i32], align 16
  %listSmall = alloca [2 x i32], align 4
  %i = alloca i32, align 4
  %j = alloca i32, align 4
  %posGreatest = alloca i32, align 4
  %greatest = alloca i32, align 4
  store i32 0, i32* %retval
  %tmp = bitcast [4 x i32]* %listElem to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %tmp, i8* bitcast ([4 x i32]* @main.listElem to i8*), i64 16, i32 16, i1 false)
  store i32 -1, i32* %posGreatest, align 4
  store i32 -1, i32* %greatest, align 4
  store i32 0, i32* %i, align 4
  br label %for.cond

for.cond:                                         ; preds = %for.inc, %entry
  %tmp6 = load i32* %i, align 4
  %cmp = icmp slt i32 %tmp6, 2
  br i1 %cmp, label %for.body, label %for.end

for.body:                                         ; preds = %for.cond
  %tmp7 = load i32* %i, align 4
  %idxprom = sext i32 %tmp7 to i64
  %arrayidx = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom
  %tmp8 = load i32* %arrayidx, align 4
  %tmp9 = load i32* %i, align 4
  %idxprom10 = sext i32 %tmp9 to i64
  %arrayidx11 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom10
  store i32 %tmp8, i32* %arrayidx11, align 4
  %tmp12 = load i32* %i, align 4
  %idxprom13 = sext i32 %tmp12 to i64
  %arrayidx14 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom13
  %tmp15 = load i32* %arrayidx14, align 4
  %tmp16 = load i32* %greatest, align 4
  %cmp17 = icmp sgt i32 %tmp15, %tmp16
  br i1 %cmp17, label %if.then, label %if.end

if.then:                                          ; preds = %for.body
  %tmp18 = load i32* %i, align 4
  store i32 %tmp18, i32* %posGreatest, align 4
  %tmp19 = load i32* %i, align 4
  %idxprom20 = sext i32 %tmp19 to i64
  %arrayidx21 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom20
  %tmp22 = load i32* %arrayidx21, align 4
  store i32 %tmp22, i32* %greatest, align 4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body
  br label %for.inc

for.inc:                                          ; preds = %if.end
  %tmp23 = load i32* %i, align 4
  %inc = add nsw i32 %tmp23, 1
  store i32 %inc, i32* %i, align 4
  br label %for.cond

for.end:                                          ; preds = %for.cond
  store i32 2, i32* %i, align 4
  br label %for.cond24

for.cond24:                                       ; preds = %for.inc66, %for.end
  %tmp25 = load i32* %i, align 4
  %cmp26 = icmp slt i32 %tmp25, 4
  br i1 %cmp26, label %for.body27, label %for.end69

for.body27:                                       ; preds = %for.cond24
  %tmp28 = load i32* %i, align 4
  %idxprom29 = sext i32 %tmp28 to i64
  %arrayidx30 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom29
  %tmp31 = load i32* %arrayidx30, align 4
  %tmp32 = load i32* %greatest, align 4
  %cmp33 = icmp slt i32 %tmp31, %tmp32
  br i1 %cmp33, label %if.then34, label %if.end65

if.then34:                                        ; preds = %for.body27
  %tmp35 = load i32* %i, align 4
  %idxprom36 = sext i32 %tmp35 to i64
  %arrayidx37 = getelementptr inbounds [4 x i32]* %listElem, i32 0, i64 %idxprom36
  %tmp38 = load i32* %arrayidx37, align 4
  %tmp39 = load i32* %posGreatest, align 4
  %idxprom40 = sext i32 %tmp39 to i64
  %arrayidx41 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom40
  store i32 %tmp38, i32* %arrayidx41, align 4
  store i32 0, i32* %posGreatest, align 4
  %arrayidx42 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %tmp43 = load i32* %arrayidx42, align 4
  store i32 %tmp43, i32* %greatest, align 4
  store i32 1, i32* %j, align 4
  br label %for.cond44

for.cond44:                                       ; preds = %for.inc61, %if.then34
  %tmp45 = load i32* %j, align 4
  %cmp46 = icmp slt i32 %tmp45, 2
  br i1 %cmp46, label %for.body47, label %for.end64

for.body47:                                       ; preds = %for.cond44
  %tmp48 = load i32* %j, align 4
  %idxprom49 = sext i32 %tmp48 to i64
  %arrayidx50 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom49
  %tmp51 = load i32* %arrayidx50, align 4
  %tmp52 = load i32* %greatest, align 4
  %cmp53 = icmp sgt i32 %tmp51, %tmp52
  br i1 %cmp53, label %if.then54, label %if.end60

if.then54:                                        ; preds = %for.body47
  %tmp55 = load i32* %j, align 4
  store i32 %tmp55, i32* %posGreatest, align 4
  %tmp56 = load i32* %j, align 4
  %idxprom57 = sext i32 %tmp56 to i64
  %arrayidx58 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 %idxprom57
  %tmp59 = load i32* %arrayidx58, align 4
  store i32 %tmp59, i32* %greatest, align 4
  br label %if.end60

if.end60:                                         ; preds = %if.then54, %for.body47
  br label %for.inc61

for.inc61:                                        ; preds = %if.end60
  %tmp62 = load i32* %j, align 4
  %inc63 = add nsw i32 %tmp62, 1
  store i32 %inc63, i32* %j, align 4
  br label %for.cond44

for.end64:                                        ; preds = %for.cond44
  br label %if.end65

if.end65:                                         ; preds = %for.end64, %for.body27
  br label %for.inc66

for.inc66:                                        ; preds = %if.end65
  %tmp67 = load i32* %i, align 4
  %inc68 = add nsw i32 %tmp67, 1
  store i32 %inc68, i32* %i, align 4
  br label %for.cond24

for.end69:                                        ; preds = %for.cond24
  %arrayidx70 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 0
  %tmp71 = load i32* %arrayidx70, align 4
  %cmp72 = icmp ne i32 %tmp71, 5
  br i1 %cmp72, label %if.then76, label %lor.lhs.false

lor.lhs.false:                                    ; preds = %for.end69
  %arrayidx73 = getelementptr inbounds [2 x i32]* %listSmall, i32 0, i64 1
  %tmp74 = load i32* %arrayidx73, align 4
  %cmp75 = icmp ne i32 %tmp74, 2
  br i1 %cmp75, label %if.then76, label %if.end77

if.then76:                                        ; preds = %lor.lhs.false, %for.end69
  call void @abort() noreturn
  unreachable

if.end77:                                         ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn
  unreachable

return:                                           ; No predecessors!
  %0 = load i32* %retval
  ret i32 %0
}

declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture, i8* nocapture, i64, i32, i1) nounwind

declare void @abort() noreturn

declare void @exit(i32) noreturn
