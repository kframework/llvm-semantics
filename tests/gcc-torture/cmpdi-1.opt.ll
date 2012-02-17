; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/cmpdi-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@args = global [8 x i64] [i64 0, i64 1, i64 -1, i64 9223372036854775807, i64 -9223372036854775808, i64 -9223372036854775807, i64 1891269347843992664, i64 -7816825554603336956], align 16
@correct_results = global [640 x i32] [i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 13, i32 140, i32 13, i32 140, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13, i32 140, i32 13], align 16

define i32 @feq(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fne(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp eq i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @flt(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fge(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp slt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fgt(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fle(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp sgt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fltu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fgeu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ult i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @fgtu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i64 %x, %y
  %. = select i1 %cmp, i32 13, i32 140
  ret i32 %.
}

define i32 @fleu(i64 %x, i64 %y) nounwind uwtable readnone {
entry:
  %cmp = icmp ugt i64 %x, %y
  %. = select i1 %cmp, i32 140, i32 13
  ret i32 %.
}

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.cond

for.cond:                                         ; preds = %for.inc100, %entry
  %indvar53 = phi i64 [ %indvar.next54, %for.inc100 ], [ 0, %entry ]
  %incdec.ptr9420 = phi i32* [ %incdec.ptr9421, %for.inc100 ], [ getelementptr inbounds ([640 x i32]* @correct_results, i64 0, i64 0), %entry ]
  %storemerge = trunc i64 %indvar53 to i32
  %cmp = icmp slt i32 %storemerge, 8
  br i1 %cmp, label %for.body, label %for.end103

for.body:                                         ; preds = %for.cond
  %arrayidx = getelementptr [8 x i64]* @args, i64 0, i64 %indvar53
  %tmp3 = load i64* %arrayidx, align 8
  br label %for.cond4

for.cond4:                                        ; preds = %for.inc, %for.body
  %indvar = phi i64 [ %indvar.next, %for.inc ], [ 0, %for.body ]
  %tmp = mul i64 %indvar, 10
  %incdec.ptr9421 = getelementptr i32* %incdec.ptr9420, i64 %tmp
  %tmp42 = add i64 %tmp, 9
  %incdec.ptr85 = getelementptr i32* %incdec.ptr9420, i64 %tmp42
  %tmp43 = add i64 %tmp, 8
  %incdec.ptr76 = getelementptr i32* %incdec.ptr9420, i64 %tmp43
  %tmp44 = add i64 %tmp, 7
  %incdec.ptr67 = getelementptr i32* %incdec.ptr9420, i64 %tmp44
  %tmp45 = add i64 %tmp, 6
  %incdec.ptr58 = getelementptr i32* %incdec.ptr9420, i64 %tmp45
  %tmp46 = add i64 %tmp, 5
  %incdec.ptr49 = getelementptr i32* %incdec.ptr9420, i64 %tmp46
  %tmp47 = add i64 %tmp, 4
  %incdec.ptr40 = getelementptr i32* %incdec.ptr9420, i64 %tmp47
  %tmp48 = add i64 %tmp, 3
  %incdec.ptr31 = getelementptr i32* %incdec.ptr9420, i64 %tmp48
  %tmp49 = add i64 %tmp, 2
  %incdec.ptr22 = getelementptr i32* %incdec.ptr9420, i64 %tmp49
  %tmp5156 = or i64 %tmp, 1
  %incdec.ptr = getelementptr i32* %incdec.ptr9420, i64 %tmp5156
  %storemerge1 = trunc i64 %indvar to i32
  %cmp6 = icmp slt i32 %storemerge1, 8
  br i1 %cmp6, label %for.body7, label %for.inc100

for.body7:                                        ; preds = %for.cond4
  %arrayidx11 = getelementptr [8 x i64]* @args, i64 0, i64 %indvar
  %tmp12 = load i64* %arrayidx11, align 8
  %cmp.i = icmp eq i64 %tmp3, %tmp12
  %..i = select i1 %cmp.i, i32 13, i32 140
  %tmp16 = load i32* %incdec.ptr9421, align 4
  %cmp17 = icmp eq i32 %..i, %tmp16
  br i1 %cmp17, label %if.end, label %if.then

if.then:                                          ; preds = %for.body7
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %for.body7
  %..i19 = select i1 %cmp.i, i32 140, i32 13
  %tmp23 = load i32* %incdec.ptr, align 4
  %cmp24 = icmp eq i32 %..i19, %tmp23
  br i1 %cmp24, label %if.end26, label %if.then25

if.then25:                                        ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end26:                                         ; preds = %if.end
  %cmp.i16 = icmp slt i64 %tmp3, %tmp12
  %..i17 = select i1 %cmp.i16, i32 13, i32 140
  %tmp32 = load i32* %incdec.ptr22, align 4
  %cmp33 = icmp eq i32 %..i17, %tmp32
  br i1 %cmp33, label %if.end35, label %if.then34

if.then34:                                        ; preds = %if.end26
  tail call void @abort() noreturn nounwind
  unreachable

if.end35:                                         ; preds = %if.end26
  %..i15 = select i1 %cmp.i16, i32 140, i32 13
  %tmp41 = load i32* %incdec.ptr31, align 4
  %cmp42 = icmp eq i32 %..i15, %tmp41
  br i1 %cmp42, label %if.end44, label %if.then43

if.then43:                                        ; preds = %if.end35
  tail call void @abort() noreturn nounwind
  unreachable

if.end44:                                         ; preds = %if.end35
  %cmp.i12 = icmp sgt i64 %tmp3, %tmp12
  %..i13 = select i1 %cmp.i12, i32 13, i32 140
  %tmp50 = load i32* %incdec.ptr40, align 4
  %cmp51 = icmp eq i32 %..i13, %tmp50
  br i1 %cmp51, label %if.end53, label %if.then52

if.then52:                                        ; preds = %if.end44
  tail call void @abort() noreturn nounwind
  unreachable

if.end53:                                         ; preds = %if.end44
  %..i11 = select i1 %cmp.i12, i32 140, i32 13
  %tmp59 = load i32* %incdec.ptr49, align 4
  %cmp60 = icmp eq i32 %..i11, %tmp59
  br i1 %cmp60, label %if.end62, label %if.then61

if.then61:                                        ; preds = %if.end53
  tail call void @abort() noreturn nounwind
  unreachable

if.end62:                                         ; preds = %if.end53
  %cmp.i8 = icmp ult i64 %tmp3, %tmp12
  %..i9 = select i1 %cmp.i8, i32 13, i32 140
  %tmp68 = load i32* %incdec.ptr58, align 4
  %cmp69 = icmp eq i32 %..i9, %tmp68
  br i1 %cmp69, label %if.end71, label %if.then70

if.then70:                                        ; preds = %if.end62
  tail call void @abort() noreturn nounwind
  unreachable

if.end71:                                         ; preds = %if.end62
  %..i7 = select i1 %cmp.i8, i32 140, i32 13
  %tmp77 = load i32* %incdec.ptr67, align 4
  %cmp78 = icmp eq i32 %..i7, %tmp77
  br i1 %cmp78, label %if.end80, label %if.then79

if.then79:                                        ; preds = %if.end71
  tail call void @abort() noreturn nounwind
  unreachable

if.end80:                                         ; preds = %if.end71
  %cmp.i4 = icmp ugt i64 %tmp3, %tmp12
  %..i5 = select i1 %cmp.i4, i32 13, i32 140
  %tmp86 = load i32* %incdec.ptr76, align 4
  %cmp87 = icmp eq i32 %..i5, %tmp86
  br i1 %cmp87, label %if.end89, label %if.then88

if.then88:                                        ; preds = %if.end80
  tail call void @abort() noreturn nounwind
  unreachable

if.end89:                                         ; preds = %if.end80
  %..i3 = select i1 %cmp.i4, i32 140, i32 13
  %tmp95 = load i32* %incdec.ptr85, align 4
  %cmp96 = icmp eq i32 %..i3, %tmp95
  br i1 %cmp96, label %for.inc, label %if.then97

if.then97:                                        ; preds = %if.end89
  tail call void @abort() noreturn nounwind
  unreachable

for.inc:                                          ; preds = %if.end89
  %indvar.next = add i64 %indvar, 1
  br label %for.cond4

for.inc100:                                       ; preds = %for.cond4
  %indvar.next54 = add i64 %indvar53, 1
  br label %for.cond

for.end103:                                       ; preds = %for.cond
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn

declare void @exit(i32) noreturn
