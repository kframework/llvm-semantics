; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20020402-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @main() noreturn nounwind uwtable {
for.inc66:
  %listSmall = alloca i64, align 8
  %tmpcast = bitcast i64* %listSmall to [2 x i32]*
  store i64 8589934622, i64* %listSmall, align 8
  %arrayidx42 = bitcast i64* %listSmall to i32*
  store i32 10, i32* %arrayidx42, align 8
  %arrayidx50 = getelementptr [2 x i32]* %tmpcast, i64 0, i64 1
  %tmp51 = load i32* %arrayidx50, align 4
  %cmp53 = icmp sgt i32 %tmp51, 10
  %phitmp42 = icmp sgt i32 %tmp51, 5
  %not.cmp53 = xor i1 %cmp53, true
  %phitmp = or i1 %phitmp42, %not.cmp53
  br i1 %phitmp, label %for.inc66.1, label %if.then76

lor.lhs.false:                                    ; preds = %for.inc66.1
  %arrayidx73 = getelementptr inbounds [2 x i32]* %tmpcast, i64 0, i64 1
  %tmp74 = load i32* %arrayidx73, align 4
  %cmp75 = icmp eq i32 %tmp74, 2
  br i1 %cmp75, label %if.end77, label %if.then76

if.then76:                                        ; preds = %for.inc66, %lor.lhs.false, %for.inc66.1
  call void @abort() noreturn nounwind
  unreachable

if.end77:                                         ; preds = %lor.lhs.false
  call void @exit(i32 0) noreturn nounwind
  unreachable

for.inc66.1:                                      ; preds = %for.inc66
  %phitmp44 = zext i1 %cmp53 to i64
  %arrayidx41.1 = getelementptr inbounds [2 x i32]* %tmpcast, i64 0, i64 %phitmp44
  store i32 5, i32* %arrayidx41.1, align 4
  %tmp43.1 = load i32* %arrayidx42, align 8
  %phitmp43 = icmp eq i32 %tmp43.1, 5
  br i1 %phitmp43, label %lor.lhs.false, label %if.then76
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
