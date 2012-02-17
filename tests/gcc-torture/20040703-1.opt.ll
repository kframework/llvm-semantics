; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/20040703-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%0 = type { i64, i64 }
%struct.cpp_num = type { i32, i32, i32, i32 }

@precision = global i32 64, align 4
@n = global i32 16, align 4
@num = global %struct.cpp_num { i32 0, i32 3, i32 0, i32 0 }, align 8

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

define %0 @num_lshift(i64 %num.coerce0, i64 %num.coerce1, i32 %precision, i32 %n) nounwind uwtable readnone {
entry:
  %tmp86 = zext i64 %num.coerce1 to i128
  %tmp87 = shl nuw i128 %tmp86, 64
  %cmp = icmp ult i32 %n, %precision
  br i1 %cmp, label %if.else, label %if.then

if.then:                                          ; preds = %entry
  %tmp46 = trunc i64 %num.coerce1 to i32
  %tobool = icmp eq i32 %tmp46, 0
  br i1 %tobool, label %land.rhs, label %land.end

land.rhs:                                         ; preds = %if.then
  %tmp91 = lshr i64 %num.coerce0, 32
  %or139 = or i64 %tmp91, %num.coerce0
  %or = trunc i64 %or139 to i32
  %lnot = icmp ne i32 %or, 0
  %phitmp130 = zext i1 %lnot to i128
  %phitmp131 = shl nuw nsw i128 %phitmp130, 96
  br label %land.end

land.end:                                         ; preds = %if.then, %land.rhs
  %0 = phi i128 [ 0, %if.then ], [ %phitmp131, %land.rhs ]
  %mask96 = and i128 %tmp87, 79228162495817593519834398720
  %mask99 = or i128 %0, %mask96
  %extract137 = lshr exact i128 %mask99, 64
  %extract.t138 = trunc i128 %extract137 to i64
  br label %if.end71

if.else:                                          ; preds = %entry
  %tmp38 = trunc i64 %num.coerce0 to i32
  %tmp35 = lshr i64 %num.coerce0, 32
  %tmp36 = trunc i64 %tmp35 to i32
  %sub = add i32 %n, -32
  %cmp14 = icmp ugt i32 %n, 31
  %sub.n = select i1 %cmp14, i32 %sub, i32 %n
  %tmp48.pn.in = select i1 %cmp14, i64 %tmp35, i64 %num.coerce0
  %tmp48.pn = zext i64 %tmp48.pn.in to i128
  %ins122127 = or i128 %tmp87, %tmp48.pn
  %tobool25 = icmp eq i32 %sub.n, 0
  br i1 %tobool25, label %if.end41, label %if.then26

if.then26:                                        ; preds = %if.else
  %tmp56 = trunc i64 %tmp48.pn.in to i32
  %shl = shl i32 %tmp56, %sub.n
  %tmp106 = lshr i64 %tmp48.pn.in, 32
  %tmp107 = trunc i64 %tmp106 to i32
  %sub34 = sub i32 32, %sub.n
  %shr = lshr i32 %tmp107, %sub34
  %or35 = or i32 %shr, %shl
  %tmp52 = zext i32 %or35 to i128
  %shl40 = shl i32 %tmp107, %sub.n
  %tmp109 = zext i32 %shl40 to i128
  %tmp110 = shl nuw nsw i128 %tmp109, 32
  %mask111 = or i128 %tmp110, %tmp87
  %ins112 = or i128 %mask111, %tmp52
  br label %if.end41

if.end41:                                         ; preds = %if.else, %if.then26
  %ins122128 = phi i128 [ %ins122127, %if.else ], [ %ins112, %if.then26 ]
  %tmp80 = trunc i128 %ins122128 to i64
  %cmp.i = icmp ugt i32 %precision, 32
  br i1 %cmp.i, label %if.then.i, label %if.else.i

if.then.i:                                        ; preds = %if.end41
  %sub.i = add i32 %precision, -32
  %cmp7.i = icmp ult i32 %sub.i, 32
  br i1 %cmp7.i, label %if.then9.i, label %num_trim.exit

if.then9.i:                                       ; preds = %if.then.i
  %shl.i = shl i32 1, %sub.i
  %sub11.i = add i32 %shl.i, -1
  %tmp2.i = trunc i128 %ins122128 to i32
  %and.i = and i32 %tmp2.i, %sub11.i
  %tmp3.i = zext i32 %and.i to i64
  %mask.i = and i64 %tmp80, -4294967296
  %ins.i = or i64 %tmp3.i, %mask.i
  br label %num_trim.exit

if.else.i:                                        ; preds = %if.end41
  %cmp15.i = icmp ult i32 %precision, 32
  br i1 %cmp15.i, label %if.then17.i, label %if.end23.i

if.then17.i:                                      ; preds = %if.else.i
  %shl19.i = shl i32 1, %precision
  %sub20.i = add i32 %shl19.i, -1
  %tmp22.i = lshr i64 %tmp80, 32
  %tmp23.i = trunc i64 %tmp22.i to i32
  %and22.i = and i32 %tmp23.i, %sub20.i
  %tmp16.i = zext i32 %and22.i to i64
  %tmp17.i = shl nuw i64 %tmp16.i, 32
  %mask18.i = and i64 %tmp80, 4294967295
  %ins19.i = or i64 %tmp17.i, %mask18.i
  br label %if.end23.i

if.end23.i:                                       ; preds = %if.then17.i, %if.else.i
  %tmp2029.off0.i = phi i64 [ %ins19.i, %if.then17.i ], [ %tmp80, %if.else.i ]
  %extract.t32.i = and i64 %tmp2029.off0.i, -4294967296
  br label %num_trim.exit

num_trim.exit:                                    ; preds = %if.then.i, %if.then9.i, %if.end23.i
  %tmp2030.off0.i = phi i64 [ %tmp80, %if.then.i ], [ %ins.i, %if.then9.i ], [ %extract.t32.i, %if.end23.i ]
  %tmp64 = lshr i128 %ins122128, 64
  %tmp65 = trunc i128 %tmp64 to i32
  %tobool45 = icmp eq i32 %tmp65, 0
  br i1 %tobool45, label %if.else48, label %if.then46

if.then46:                                        ; preds = %num_trim.exit
  %mask117.tr = trunc i128 %tmp64 to i64
  %extract.t134 = and i64 %mask117.tr, 4294967295
  br label %if.end71

if.else48:                                        ; preds = %num_trim.exit
  %tmp56.i = zext i64 %tmp2030.off0.i to i128
  %tmp61.i = and i128 %ins122128, -18446744073709551616
  %ins63.i = or i128 %tmp56.i, %tmp61.i
  br i1 %cmp.i, label %if.then.i.i, label %if.end.i.i

if.then.i.i:                                      ; preds = %if.else48
  %tmp1.i.i = trunc i64 %tmp2030.off0.i to i32
  %sub7.i.i = add i32 %precision, -33
  %shl.i.i = shl i32 1, %sub7.i.i
  %and.i.i = and i32 %tmp1.i.i, %shl.i.i
  %cmp8.i.i = icmp eq i32 %and.i.i, 0
  %conv9.i.i = zext i1 %cmp8.i.i to i32
  br label %num_positive.exit.i

if.end.i.i:                                       ; preds = %if.else48
  %tmp9.i.i = lshr i64 %tmp2030.off0.i, 32
  %tmp11.i.i = trunc i64 %tmp9.i.i to i32
  %sub12.i.i = add i32 %precision, -1
  %shl13.i.i = shl i32 1, %sub12.i.i
  %and14.i.i = and i32 %tmp11.i.i, %shl13.i.i
  %cmp15.i.i = icmp eq i32 %and14.i.i, 0
  %conv16.i.i = zext i1 %cmp15.i.i to i32
  br label %num_positive.exit.i

num_positive.exit.i:                              ; preds = %if.end.i.i, %if.then.i.i
  %storemerge.i.i = phi i32 [ %conv9.i.i, %if.then.i.i ], [ %conv16.i.i, %if.end.i.i ]
  %1 = or i32 %storemerge.i.i, %tmp65
  %2 = icmp eq i32 %1, 0
  %storemerge.i = sext i1 %2 to i32
  br i1 %cmp, label %if.else8.i, label %if.then6.i

if.then6.i:                                       ; preds = %num_positive.exit.i
  %tmp65.i = zext i32 %storemerge.i to i128
  %tmp66.i = shl nuw nsw i128 %tmp65.i, 32
  %ins.i4 = or i128 %tmp66.i, %tmp65.i
  %extract.t104.i = trunc i128 %ins.i4 to i64
  br label %if.end77.i

if.else8.i:                                       ; preds = %num_positive.exit.i
  %cmp10.i = icmp ult i32 %precision, 32
  br i1 %cmp10.i, label %if.then12.i, label %if.else19.i

if.then12.i:                                      ; preds = %if.else8.i
  %tmp9.i = zext i32 %storemerge.i to i128
  %shl.i5 = shl i32 %storemerge.i, %precision
  %tmp75.i = lshr i64 %tmp2030.off0.i, 32
  %tmp76.i = trunc i64 %tmp75.i to i32
  %or.i = or i32 %shl.i5, %tmp76.i
  %tmp70.i = zext i32 %or.i to i128
  %tmp71.i = shl nuw nsw i128 %tmp70.i, 32
  %ins11.i = or i128 %tmp9.i, %tmp61.i
  %ins73.i = or i128 %ins11.i, %tmp71.i
  br label %if.end33.i

if.else19.i:                                      ; preds = %if.else8.i
  %cmp22.i = icmp ult i32 %precision, 64
  br i1 %cmp22.i, label %if.then24.i, label %if.end33.i

if.then24.i:                                      ; preds = %if.else19.i
  %sub.i6 = add i32 %precision, -32
  %shl28.i = shl i32 %storemerge.i, %sub.i6
  %tmp13.i = trunc i64 %tmp2030.off0.i to i32
  %or31.i = or i32 %shl28.i, %tmp13.i
  %tmp15.i = zext i32 %or31.i to i128
  %mask16.i = and i128 %ins63.i, -4294967296
  %ins17.i = or i128 %tmp15.i, %mask16.i
  br label %if.end33.i

if.end33.i:                                       ; preds = %if.then24.i, %if.else19.i, %if.then12.i
  %mask9198.i = phi i128 [ %ins63.i, %if.else19.i ], [ %ins17.i, %if.then24.i ], [ %ins73.i, %if.then12.i ]
  %extract.t110.i = trunc i128 %mask9198.i to i32
  %extract.t113.i = trunc i128 %mask9198.i to i64
  %extract116.i = lshr i128 %mask9198.i, 32
  %extract.t117.i = trunc i128 %extract116.i to i32
  br i1 %cmp14, label %if.then38.i, label %if.end48.i

if.then38.i:                                      ; preds = %if.end33.i
  %sub41.i = add i32 %n, -32
  %tmp78.i = shl i128 %mask9198.i, 32
  %tmp19.i = zext i32 %storemerge.i to i128
  %ins21.i = or i128 %tmp78.i, %tmp19.i
  %extract.t112.i = trunc i128 %ins21.i to i64
  br label %if.end48.i

if.end48.i:                                       ; preds = %if.then38.i, %if.end33.i
  %mask9197.off0.i = phi i32 [ %storemerge.i, %if.then38.i ], [ %extract.t110.i, %if.end33.i ]
  %mask9197.off0111.i = phi i64 [ %extract.t112.i, %if.then38.i ], [ %extract.t113.i, %if.end33.i ]
  %mask9197.off32.i = phi i32 [ %extract.t110.i, %if.then38.i ], [ %extract.t117.i, %if.end33.i ]
  %tmp667.i = phi i32 [ %sub41.i, %if.then38.i ], [ %n, %if.end33.i ]
  %tobool50.i = icmp eq i32 %tmp667.i, 0
  br i1 %tobool50.i, label %if.end77.i, label %if.then51.i

if.then51.i:                                      ; preds = %if.end48.i
  %shr.i = lshr i32 %mask9197.off32.i, %tmp667.i
  %sub59.i = sub i32 32, %tmp667.i
  %shl61.i = shl i32 %mask9197.off0.i, %sub59.i
  %or62.i = or i32 %shl61.i, %shr.i
  %tmp86.i = zext i32 %or62.i to i64
  %tmp87.i = shl nuw i64 %tmp86.i, 32
  %shr67.i = lshr i32 %mask9197.off0.i, %tmp667.i
  %shl73.i = shl i32 %storemerge.i, %sub59.i
  %or74.i = or i32 %shl73.i, %shr67.i
  %tmp25.i = zext i32 %or74.i to i64
  %ins27.i = or i64 %tmp87.i, %tmp25.i
  br label %if.end77.i

if.end77.i:                                       ; preds = %if.then51.i, %if.end48.i, %if.then6.i
  %mask9196.off0.i = phi i32 [ %or74.i, %if.then51.i ], [ %mask9197.off0.i, %if.end48.i ], [ %storemerge.i, %if.then6.i ]
  %mask9196.off0101.i = phi i64 [ %ins27.i, %if.then51.i ], [ %mask9197.off0111.i, %if.end48.i ], [ %extract.t104.i, %if.then6.i ]
  br i1 %cmp.i, label %if.then.i3.i, label %if.else.i.i

if.then.i3.i:                                     ; preds = %if.end77.i
  %sub.i.i = add i32 %precision, -32
  %cmp7.i.i = icmp ult i32 %sub.i.i, 32
  br i1 %cmp7.i.i, label %if.then9.i.i, label %num_rshift.exit

if.then9.i.i:                                     ; preds = %if.then.i3.i
  %shl.i4.i = shl i32 1, %sub.i.i
  %sub11.i.i = add i32 %shl.i4.i, -1
  %and.i5.i = and i32 %mask9196.off0.i, %sub11.i.i
  %tmp3.i.i = zext i32 %and.i5.i to i64
  %mask.i.i = and i64 %mask9196.off0101.i, -4294967296
  %ins.i.i = or i64 %tmp3.i.i, %mask.i.i
  br label %num_rshift.exit

if.else.i.i:                                      ; preds = %if.end77.i
  %cmp15.i6.i = icmp ult i32 %precision, 32
  br i1 %cmp15.i6.i, label %if.then17.i.i, label %if.end23.i.i

if.then17.i.i:                                    ; preds = %if.else.i.i
  %shl19.i.i = shl i32 1, %precision
  %sub20.i.i = add i32 %shl19.i.i, -1
  %tmp22.i.i = lshr i64 %mask9196.off0101.i, 32
  %tmp23.i.i = trunc i64 %tmp22.i.i to i32
  %and22.i.i = and i32 %tmp23.i.i, %sub20.i.i
  %tmp16.i.i = zext i32 %and22.i.i to i64
  %tmp17.i.i = shl nuw i64 %tmp16.i.i, 32
  %mask18.i.i = and i64 %mask9196.off0101.i, 4294967295
  %ins19.i.i = or i64 %tmp17.i.i, %mask18.i.i
  br label %if.end23.i.i

if.end23.i.i:                                     ; preds = %if.then17.i.i, %if.else.i.i
  %tmp2029.off0.i.i = phi i64 [ %ins19.i.i, %if.then17.i.i ], [ %mask9196.off0101.i, %if.else.i.i ]
  %extract.t32.i.i = and i64 %tmp2029.off0.i.i, -4294967296
  br label %num_rshift.exit

num_rshift.exit:                                  ; preds = %if.then.i3.i, %if.then9.i.i, %if.end23.i.i
  %tmp2030.off0.i.i = phi i64 [ %mask9196.off0101.i, %if.then.i3.i ], [ %ins.i.i, %if.then9.i.i ], [ %extract.t32.i.i, %if.end23.i.i ]
  %tmp18 = lshr i64 %tmp2030.off0.i.i, 32
  %tmp19 = trunc i64 %tmp18 to i32
  %cmp57 = icmp eq i32 %tmp36, %tmp19
  br i1 %cmp57, label %land.rhs59, label %land.end66

land.rhs59:                                       ; preds = %num_rshift.exit
  %tmp9 = trunc i64 %tmp2030.off0.i.i to i32
  %phitmp = icmp ne i32 %tmp38, %tmp9
  %phitmp140 = zext i1 %phitmp to i128
  %phitmp141 = shl nuw nsw i128 %phitmp140, 96
  br label %land.end66

land.end66:                                       ; preds = %land.rhs59, %num_rshift.exit
  %3 = phi i128 [ 79228162514264337593543950336, %num_rshift.exit ], [ %phitmp141, %land.rhs59 ]
  %tmp77.masked = and i128 %ins122128, 79228162495817593519834398720
  %ins122 = or i128 %3, %tmp77.masked
  %extract135 = lshr exact i128 %ins122, 64
  %extract.t136 = trunc i128 %extract135 to i64
  br label %if.end71

if.end71:                                         ; preds = %if.then46, %land.end66, %land.end
  %ins122129.off0 = phi i64 [ %tmp2030.off0.i, %if.then46 ], [ %tmp2030.off0.i, %land.end66 ], [ 0, %land.end ]
  %ins122129.off64 = phi i64 [ %extract.t134, %if.then46 ], [ %extract.t136, %land.end66 ], [ %extract.t138, %land.end ]
  %insert = insertvalue %0 undef, i64 %ins122129.off0, 0
  %insert124 = insertvalue %0 %insert, i64 %ins122129.off64, 1
  ret %0 %insert124
}

define i32 @main() noreturn nounwind uwtable {
entry:
  %tmp = load i32* @n, align 4
  %0 = load i64* bitcast (%struct.cpp_num* @num to i64*), align 8
  %1 = load i64* bitcast (i32* getelementptr inbounds (%struct.cpp_num* @num, i64 0, i32 2) to i64*), align 8
  %call = tail call %0 @num_lshift(i64 %0, i64 %1, i32 64, i32 %tmp)
  %2 = extractvalue %0 %call, 0
  %3 = extractvalue %0 %call, 1
  %tmp12.mask = and i64 %2, -4294967296
  %cmp = icmp eq i64 %tmp12.mask, 844424930131968
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  %tmp4 = trunc i64 %2 to i32
  %cmp3 = icmp eq i32 %tmp4, 0
  br i1 %cmp3, label %if.end5, label %if.then4

if.then4:                                         ; preds = %if.end
  tail call void @abort() noreturn nounwind
  unreachable

if.end5:                                          ; preds = %if.end
  %cmp7 = icmp ult i64 %3, 4294967296
  br i1 %cmp7, label %if.end9, label %if.then8

if.then8:                                         ; preds = %if.end5
  tail call void @abort() noreturn nounwind
  unreachable

if.end9:                                          ; preds = %if.end5
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @abort() noreturn nounwind

declare void @exit(i32) noreturn nounwind
