; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20051113-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.Struct2 = type <{ i16, i16, i16, i64, i64, i64 }>
%struct.Struct3 = type <{ i32, [0 x %union.Union] }>
%union.Union = type { %struct.Struct2 }

define i32 @gnu_dev_major(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %shr = lshr i64 %__dev, 8
  %and = and i64 %shr, 4095
  %shr2 = lshr i64 %__dev, 32
  %and3 = and i64 %shr2, 4294963200
  %or = or i64 %and, %and3
  %conv5 = trunc i64 %or to i32
  ret i32 %conv5
}

define i32 @gnu_dev_minor(i64 %__dev) nounwind uwtable readnone inlinehint {
entry:
  %and = and i64 %__dev, 255
  %shr = lshr i64 %__dev, 12
  %and2 = and i64 %shr, 4294967040
  %or = or i64 %and2, %and
  %conv4 = trunc i64 %or to i32
  ret i32 %conv4
}

define i64 @gnu_dev_makedev(i32 %__major, i32 %__minor) nounwind uwtable readnone inlinehint {
entry:
  %and = and i32 %__minor, 255
  %and2 = shl i32 %__major, 8
  %shl = and i32 %and2, 1048320
  %or = or i32 %and, %shl
  %conv = zext i32 %or to i64
  %and4 = and i32 %__minor, -256
  %conv5 = zext i32 %and4 to i64
  %shl6 = shl nuw nsw i64 %conv5, 12
  %and9 = and i32 %__major, -4096
  %conv10 = zext i32 %and9 to i64
  %shl11 = shl nuw i64 %conv10, 32
  %or7 = or i64 %shl6, %shl11
  %or12 = or i64 %or7, %conv
  ret i64 %or12
}

define i64 @Sum(%struct.Struct3* %instrs) nounwind uwtable readonly noinline {
entry:
  %Count = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 0
  %tmp22 = load i32* %Count, align 1
  %cmp3 = icmp sgt i32 %tmp22, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = icmp sgt i32 %tmp22, 1
  %tmp22.op = add i32 %tmp22, -1
  %0 = zext i32 %tmp22.op to i64
  %.op = add i64 %0, 1
  %tmp9 = select i1 %tmp, i64 %.op, i64 1
  %scevgep = getelementptr %struct.Struct3* %instrs, i64 2, i32 0
  %scevgep10 = bitcast i32* %scevgep to i8*
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %tmp914 = phi i64 [ 0, %for.body.lr.ph ], [ %add, %for.body ]
  %tmp11 = mul i64 %indvar, 30
  %tmp12 = add i64 %tmp11, 2
  %uglygep = getelementptr i8* %scevgep10, i64 %tmp12
  %uglygep13 = bitcast i8* %uglygep to i64*
  %tmp6 = load i64* %uglygep13, align 1
  %add = add i64 %tmp6, %tmp914
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp9
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp91.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  ret i64 %tmp91.lcssa
}

define i64 @Sum2(%struct.Struct3* %instrs) nounwind uwtable readonly noinline {
entry:
  %Count = getelementptr inbounds %struct.Struct3* %instrs, i64 0, i32 0
  %tmp22 = load i32* %Count, align 1
  %cmp3 = icmp sgt i32 %tmp22, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end

for.body.lr.ph:                                   ; preds = %entry
  %tmp = icmp sgt i32 %tmp22, 1
  %tmp22.op = add i32 %tmp22, -1
  %0 = zext i32 %tmp22.op to i64
  %.op = add i64 %0, 1
  %tmp8 = select i1 %tmp, i64 %.op, i64 1
  %scevgep = getelementptr %struct.Struct3* %instrs, i64 4, i32 0
  %scevgep9 = bitcast i32* %scevgep to i8*
  br label %for.body

for.body:                                         ; preds = %for.body, %for.body.lr.ph
  %indvar = phi i64 [ 0, %for.body.lr.ph ], [ %indvar.next, %for.body ]
  %tmp814 = phi i64 [ 0, %for.body.lr.ph ], [ %add, %for.body ]
  %tmp10 = mul i64 %indvar, 30
  %tmp11 = add i64 %tmp10, 2
  %uglygep = getelementptr i8* %scevgep9, i64 %tmp11
  %uglygep12 = bitcast i8* %uglygep to i64*
  %tmp5 = load i64* %uglygep12, align 1
  %add = add nsw i64 %tmp5, %tmp814
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, %tmp8
  br i1 %exitcond, label %for.end, label %for.body

for.end:                                          ; preds = %for.body, %entry
  %tmp81.lcssa = phi i64 [ 0, %entry ], [ %add, %for.body ]
  ret i64 %tmp81.lcssa
}

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 94) nounwind
  %0 = bitcast i8* %call to %struct.Struct3*
  tail call void @llvm.memset.p0i8.i64(i8* %call, i8 0, i64 94, i32 1, i1 false)
  %Count = bitcast i8* %call to i32*
  store i32 3, i32* %Count, align 1
  %1 = getelementptr inbounds i8* %call, i64 10
  %2 = bitcast i8* %1 to i64*
  store i64 555, i64* %2, align 1
  %3 = getelementptr inbounds i8* %call, i64 40
  %4 = bitcast i8* %3 to i64*
  store i64 999, i64* %4, align 1
  %5 = getelementptr inbounds i8* %call, i64 70
  %6 = bitcast i8* %5 to i64*
  store i64 4311810305, i64* %6, align 1
  %7 = getelementptr inbounds i8* %call, i64 18
  %8 = bitcast i8* %7 to i64*
  store i64 555, i64* %8, align 1
  %9 = getelementptr inbounds i8* %call, i64 48
  %10 = bitcast i8* %9 to i64*
  store i64 999, i64* %10, align 1
  %11 = getelementptr inbounds i8* %call, i64 78
  %12 = bitcast i8* %11 to i64*
  store i64 4311810305, i64* %12, align 1
  %call29 = tail call i64 @Sum(%struct.Struct3* %0)
  %cmp = icmp eq i64 %call29, 4311811859
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %call31 = tail call i64 @Sum2(%struct.Struct3* %0)
  %cmp32 = icmp eq i64 %call31, 4311811859
  br i1 %cmp32, label %if.end34, label %if.then33

if.then33:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end34:                                         ; preds = %if.end
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind

declare void @abort() noreturn nounwind
