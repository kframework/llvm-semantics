; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr31448.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._st = type { [3 x i8], i8, [3 x i8], i8 }

@g.constreg = internal constant [1 x i32] zeroinitializer, align 4
@f.constreg = internal constant [1 x i32] [i32 -16843010], align 4
@next = common global %struct._st* null, align 8

define void @g() nounwind uwtable {
entry:
  %next = alloca %struct._st*, align 8
  %nIndx = alloca i32, align 4
  store %struct._st* null, %struct._st** %next, align 8
  store i32 0, i32* %nIndx, align 4
  %0 = load i32* %nIndx, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @g.constreg, i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  %2 = load %struct._st** %next, align 8
  %bf.value = and i32 %1, 16777215
  %3 = shl i32 %bf.value, 8
  %bf.reload.sext = ashr i32 %3, 8
  %4 = bitcast %struct._st* %2 to i32*
  %5 = and i32 %bf.value, 16777215
  %6 = load i32* %4, align 4
  %7 = and i32 %6, -16777216
  %8 = or i32 %7, %5
  store i32 %8, i32* %4, align 4
  ret void
}

define void @f() nounwind uwtable {
entry:
  %nIndx = alloca i32, align 4
  store i32 0, i32* %nIndx, align 4
  %0 = load i32* %nIndx, align 4
  %idxprom = sext i32 %0 to i64
  %arrayidx = getelementptr inbounds [1 x i32]* @f.constreg, i32 0, i64 %idxprom
  %1 = load i32* %arrayidx, align 4
  %2 = load %struct._st** @next, align 8
  %bf.value = and i32 %1, 16777215
  %3 = shl i32 %bf.value, 8
  %bf.reload.sext = ashr i32 %3, 8
  %4 = bitcast %struct._st* %2 to i32*
  %5 = and i32 %bf.value, 16777215
  %6 = load i32* %4, align 4
  %7 = and i32 %6, -16777216
  %8 = or i32 %7, %5
  store i32 %8, i32* %4, align 4
  %9 = load i32* %nIndx, align 4
  %idxprom1 = sext i32 %9 to i64
  %arrayidx2 = getelementptr inbounds [1 x i32]* @f.constreg, i32 0, i64 %idxprom1
  %10 = load i32* %arrayidx2, align 4
  %11 = load %struct._st** @next, align 8
  %bf.value3 = and i32 %10, 16777215
  %12 = shl i32 %bf.value3, 8
  %bf.reload.sext4 = ashr i32 %12, 8
  %13 = bitcast %struct._st* %11 to i8*
  %bf.field.offs = getelementptr i8* %13, i32 4
  %14 = bitcast i8* %bf.field.offs to i32*
  %15 = and i32 %bf.value3, 16777215
  %16 = load i32* %14, align 4
  %17 = and i32 %16, -16777216
  %18 = or i32 %17, %15
  store i32 %18, i32* %14, align 4
  ret void
}

define i32 @main() nounwind uwtable {
entry:
  %retval = alloca i32, align 4
  %a = alloca %struct._st, align 4
  store i32 0, i32* %retval
  store %struct._st* %a, %struct._st** @next, align 8
  call void @f()
  %0 = load %struct._st** @next, align 8
  %1 = bitcast %struct._st* %0 to i32*
  %2 = load i32* %1, align 4
  %bf.clear = and i32 %2, 16777215
  %3 = shl i32 %bf.clear, 8
  %bf.val.sext = ashr i32 %3, 8
  %cmp = icmp ne i32 %bf.val.sext, -65794
  br i1 %cmp, label %if.then, label %if.end

if.then:                                          ; preds = %entry
  call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %4 = load %struct._st** @next, align 8
  %5 = bitcast %struct._st* %4 to i8*
  %bf.field.offs = getelementptr i8* %5, i32 4
  %6 = bitcast i8* %bf.field.offs to i32*
  %7 = load i32* %6, align 4
  %bf.clear1 = and i32 %7, 16777215
  %8 = shl i32 %bf.clear1, 8
  %bf.val.sext2 = ashr i32 %8, 8
  %cmp3 = icmp ne i32 %bf.val.sext2, -65794
  br i1 %cmp3, label %if.then4, label %if.end5

if.then4:                                         ; preds = %if.end
  call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  ret i32 0
}

declare void @abort() noreturn nounwind
