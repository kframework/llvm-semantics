; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/loop-3c.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@a = common global [255 x i8*] zeroinitializer, align 16

define void @f(i32 %m) nounwind uwtable {
entry:
  %tmp3 = add i32 %m, 4
  %tmp6 = shl i32 %m, 3
  br label %do.body

do.body:                                          ; preds = %do.body, %entry
  %indvar = phi i32 [ %indvar.next, %do.body ], [ 0, %entry ]
  %shr2 = phi i32 [ %shr, %do.body ], [ 256, %entry ]
  %tmp = shl i32 %indvar, 2
  %add = add i32 %tmp3, %tmp
  %tmp5 = shl i32 %indvar, 5
  %shl = add i32 %tmp6, %tmp5
  %idx.ext = zext i32 %shl to i64
  %add.ptr = getelementptr inbounds i8* bitcast ([255 x i8*]* @a to i8*), i64 %idx.ext
  %shr = ashr i32 %shr2, 1
  %idxprom = sext i32 %shr to i64
  %arrayidx = getelementptr inbounds [255 x i8*]* @a, i64 0, i64 %idxprom
  store i8* %add.ptr, i8** %arrayidx, align 8
  %cmp = icmp slt i32 %add, 1073741840
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp, label %do.body, label %do.end

do.end:                                           ; preds = %do.body
  ret void
}

define i32 @main() noreturn nounwind uwtable {
f.exit:
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16
  %tmp = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  %tobool = icmp eq i8* %tmp, null
  %tmp1 = load i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  %tobool2 = icmp eq i8* %tmp1, null
  %or.cond = and i1 %tobool, %tobool2
  br i1 %or.cond, label %if.end9, label %if.then

if.then:                                          ; preds = %f.exit
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %f.exit
  store i8* null, i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8), align 16
  store i8* bitcast ([255 x i8*]* @a to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 128), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 4) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 64), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 8) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 32), align 16
  store i8* bitcast (i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 12) to i8*), i8** getelementptr inbounds ([255 x i8*]* @a, i64 0, i64 16), align 16
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
