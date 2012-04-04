; ModuleID = '/home/grosu/celliso2/c-semantics/tests/integration/duffsDevice.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [21 x i8] c"%d: src=%d, dest=%d\0A\00", align 1

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

define i32 @main() nounwind uwtable {
entry:
  %call = tail call noalias i8* @malloc(i64 404) nounwind
  %call5 = tail call noalias i8* @malloc(i64 404) nounwind
  call void @llvm.memset.p0i8.i64(i8* %call5, i8 0, i64 404, i32 4, i1 false)
  br label %for.body

sw.bb67.preheader:                                ; preds = %for.body
  %0 = bitcast i8* %call to i32*
  %1 = bitcast i8* %call5 to i32*
  %incdec.ptr4528 = getelementptr inbounds i8* %call, i64 4
  %2 = bitcast i8* %incdec.ptr4528 to i32*
  %tmp4629 = load i32* %0, align 4
  %incdec.ptr4830 = getelementptr inbounds i8* %call5, i64 4
  %3 = bitcast i8* %incdec.ptr4830 to i32*
  store i32 %tmp4629, i32* %1, align 4
  %incdec.ptr5131 = getelementptr inbounds i8* %call, i64 8
  %4 = bitcast i8* %incdec.ptr5131 to i32*
  %tmp5232 = load i32* %2, align 4
  %incdec.ptr5433 = getelementptr inbounds i8* %call5, i64 8
  %5 = bitcast i8* %incdec.ptr5433 to i32*
  store i32 %tmp5232, i32* %3, align 4
  %incdec.ptr5734 = getelementptr inbounds i8* %call, i64 12
  %6 = bitcast i8* %incdec.ptr5734 to i32*
  %tmp5835 = load i32* %4, align 4
  %incdec.ptr6036 = getelementptr inbounds i8* %call5, i64 12
  %7 = bitcast i8* %incdec.ptr6036 to i32*
  store i32 %tmp5835, i32* %5, align 4
  %incdec.ptr6337 = getelementptr inbounds i8* %call, i64 16
  %8 = bitcast i8* %incdec.ptr6337 to i32*
  %tmp6438 = load i32* %6, align 4
  %incdec.ptr6639 = getelementptr inbounds i8* %call5, i64 16
  %9 = bitcast i8* %incdec.ptr6639 to i32*
  store i32 %tmp6438, i32* %7, align 4
  %tmp7040 = load i32* %8, align 4
  store i32 %tmp7040, i32* %9, align 4
  br label %sw.bb37

for.body:                                         ; preds = %for.body, %entry
  %indvar99 = phi i64 [ 0, %entry ], [ %indvar.next100, %for.body ]
  %tmp102 = shl i64 %indvar99, 2
  %scevgep105 = getelementptr i8* %call, i64 %tmp102
  %arrayidx = bitcast i8* %scevgep105 to i32*
  %tmp107 = shl i64 %indvar99, 1
  %tmp108112 = or i64 %tmp107, 1
  %add2 = trunc i64 %tmp108112 to i32
  store i32 %add2, i32* %arrayidx, align 4
  %indvar.next100 = add i64 %indvar99, 1
  %exitcond101 = icmp eq i64 %indvar.next100, 101
  br i1 %exitcond101, label %sw.bb67.preheader, label %for.body

sw.bb37:                                          ; preds = %sw.bb37, %sw.bb67.preheader
  %indvar51 = phi i64 [ 0, %sw.bb67.preheader ], [ %indvar.next52, %sw.bb37 ]
  %tmp54 = shl i64 %indvar51, 5
  %tmp55 = add i64 %tmp54, 48
  %scevgep56 = getelementptr i8* %call, i64 %tmp55
  %incdec.ptr63 = bitcast i8* %scevgep56 to i32*
  %tmp59 = add i64 %tmp54, 44
  %scevgep60 = getelementptr i8* %call, i64 %tmp59
  %incdec.ptr57 = bitcast i8* %scevgep60 to i32*
  %tmp62 = add i64 %tmp54, 40
  %scevgep63 = getelementptr i8* %call, i64 %tmp62
  %incdec.ptr51 = bitcast i8* %scevgep63 to i32*
  %tmp65 = add i64 %tmp54, 36
  %scevgep66 = getelementptr i8* %call, i64 %tmp65
  %incdec.ptr45 = bitcast i8* %scevgep66 to i32*
  %tmp68113 = or i64 %tmp54, 20
  %scevgep69 = getelementptr i8* %call, i64 %tmp68113
  %incdec.ptr69 = bitcast i8* %scevgep69 to i32*
  %tmp71114 = or i64 %tmp54, 24
  %scevgep72 = getelementptr i8* %call, i64 %tmp71114
  %incdec.ptr = bitcast i8* %scevgep72 to i32*
  %tmp74115 = or i64 %tmp54, 28
  %scevgep75 = getelementptr i8* %call, i64 %tmp74115
  %incdec.ptr33 = bitcast i8* %scevgep75 to i32*
  %tmp77 = add i64 %tmp54, 32
  %scevgep78 = getelementptr i8* %call, i64 %tmp77
  %incdec.ptr39 = bitcast i8* %scevgep78 to i32*
  %scevgep80 = getelementptr i8* %call5, i64 %tmp55
  %incdec.ptr66 = bitcast i8* %scevgep80 to i32*
  %scevgep82 = getelementptr i8* %call5, i64 %tmp59
  %incdec.ptr60 = bitcast i8* %scevgep82 to i32*
  %scevgep84 = getelementptr i8* %call5, i64 %tmp62
  %incdec.ptr54 = bitcast i8* %scevgep84 to i32*
  %scevgep86 = getelementptr i8* %call5, i64 %tmp65
  %incdec.ptr48 = bitcast i8* %scevgep86 to i32*
  %scevgep88 = getelementptr i8* %call5, i64 %tmp68113
  %incdec.ptr72 = bitcast i8* %scevgep88 to i32*
  %scevgep90 = getelementptr i8* %call5, i64 %tmp71114
  %incdec.ptr30 = bitcast i8* %scevgep90 to i32*
  %scevgep92 = getelementptr i8* %call5, i64 %tmp74115
  %incdec.ptr36 = bitcast i8* %scevgep92 to i32*
  %scevgep94 = getelementptr i8* %call5, i64 %tmp77
  %incdec.ptr42 = bitcast i8* %scevgep94 to i32*
  %tmp28 = load i32* %incdec.ptr69, align 4
  store i32 %tmp28, i32* %incdec.ptr72, align 4
  %tmp34 = load i32* %incdec.ptr, align 4
  store i32 %tmp34, i32* %incdec.ptr30, align 4
  %tmp40 = load i32* %incdec.ptr33, align 4
  store i32 %tmp40, i32* %incdec.ptr36, align 4
  %tmp46 = load i32* %incdec.ptr39, align 4
  store i32 %tmp46, i32* %incdec.ptr42, align 4
  %tmp52 = load i32* %incdec.ptr45, align 4
  store i32 %tmp52, i32* %incdec.ptr48, align 4
  %tmp58 = load i32* %incdec.ptr51, align 4
  store i32 %tmp58, i32* %incdec.ptr54, align 4
  %tmp64 = load i32* %incdec.ptr57, align 4
  store i32 %tmp64, i32* %incdec.ptr60, align 4
  %tmp70 = load i32* %incdec.ptr63, align 4
  store i32 %tmp70, i32* %incdec.ptr66, align 4
  %indvar.next52 = add i64 %indvar51, 1
  %exitcond53 = icmp eq i64 %indvar.next52, 12
  br i1 %exitcond53, label %for.body83, label %sw.bb37

for.body83:                                       ; preds = %sw.bb37, %for.body83
  %indvar = phi i64 [ %indvar.next, %for.body83 ], [ 0, %sw.bb37 ]
  %tmp = shl i64 %indvar, 2
  %scevgep = getelementptr i8* %call5, i64 %tmp
  %arrayidx93 = bitcast i8* %scevgep to i32*
  %scevgep46 = getelementptr i8* %call, i64 %tmp
  %arrayidx88 = bitcast i8* %scevgep46 to i32*
  %storemerge127 = trunc i64 %indvar to i32
  %tmp89 = load i32* %arrayidx88, align 4
  %tmp94 = load i32* %arrayidx93, align 4
  %call95 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([21 x i8]* @.str, i64 0, i64 0), i32 %storemerge127, i32 %tmp89, i32 %tmp94) nounwind
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 101
  br i1 %exitcond, label %for.end99, label %for.body83

for.end99:                                        ; preds = %for.body83
  ret i32 0
}

declare noalias i8* @malloc(i64) nounwind

declare i32 @printf(i8* nocapture, ...) nounwind

declare void @llvm.memset.p0i8.i64(i8* nocapture, i8, i64, i32, i1) nounwind
