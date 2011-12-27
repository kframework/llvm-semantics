; ModuleID = '/home/grosu/celliso2/c-semantics/tests/unitTests/c1x-6-2-4-6.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [9 x i8] c"1i = %d\0A\00", align 1
@.str1 = private unnamed_addr constant [9 x i8] c"2i = %d\0A\00", align 1
@.str2 = private unnamed_addr constant [9 x i8] c"3i = %d\0A\00", align 1

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

define i32 @f1() nounwind uwtable {
if.then:
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 16) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind

define i32 @f2() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  br label %label.outer

label.outer:                                      ; preds = %entry, %if.then11
  %i2.ph = phi i32* [ %i, %if.then11 ], [ null, %entry ]
  %inc1.ph = phi i32 [ %inc.lcssa.ph.us, %if.then11 ], [ 0, %entry ]
  %tobool = icmp eq i32* %i2.ph, null
  br i1 %tobool, label %if.end.us.us, label %if.end

if.end.us.us:                                     ; preds = %label.outer
  %cmp.us.us = icmp slt i32 %inc1.ph, 3
  br i1 %cmp.us.us, label %if.then11, label %end

if.end:                                           ; preds = %if.then5, %label.outer
  %indvar21 = phi i32 [ %indvar.next22, %if.then5 ], [ 0, %label.outer ]
  %inc1 = add i32 %inc1.ph, %indvar21
  %tmp2 = load i32* %i2.ph, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %tmp2) nounwind
  %cmp = icmp slt i32 %inc1, 3
  br i1 %cmp, label %if.then5, label %end

if.then5:                                         ; preds = %if.end
  store i32 %inc1, i32* %i, align 4
  %indvar.next22 = add i32 %indvar21, 1
  br label %if.end

if.then11:                                        ; preds = %if.end.us.us
  store i32 %inc1.ph, i32* %i, align 4
  %inc.lcssa.ph.us = add i32 %inc1.ph, 1
  br label %label.outer

end:                                              ; preds = %if.end, %if.end.us.us
  ret i32 0
}

define i32 @f3() nounwind uwtable {
entry:
  %i = alloca i32, align 4
  br label %label.outer

label.outer:                                      ; preds = %entry, %if.then9
  %i2.ph = phi i32* [ %i, %if.then9 ], [ null, %entry ]
  %inc1.ph = phi i32 [ %inc.lcssa.ph.us, %if.then9 ], [ 0, %entry ]
  %tobool = icmp eq i32* %i2.ph, null
  br i1 %tobool, label %if.end.us.us, label %if.end

if.end.us.us:                                     ; preds = %label.outer
  store i32 5, i32* %i, align 4
  %cmp.us.us = icmp slt i32 %inc1.ph, 3
  br i1 %cmp.us.us, label %if.then9, label %if.end11

if.end:                                           ; preds = %if.then5, %label.outer
  %indvar21 = phi i32 [ %indvar.next22, %if.then5 ], [ 0, %label.outer ]
  %inc1 = add i32 %inc1.ph, %indvar21
  %tmp2 = load i32* %i2.ph, align 4
  %call = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %tmp2) nounwind
  store i32 5, i32* %i, align 4
  %cmp = icmp slt i32 %inc1, 3
  br i1 %cmp, label %if.then5, label %if.end11

if.then5:                                         ; preds = %if.end
  %indvar.next22 = add i32 %indvar21, 1
  br label %if.end

if.then9:                                         ; preds = %if.end.us.us
  %inc.lcssa.ph.us = add i32 %inc1.ph, 1
  br label %label.outer

if.end11:                                         ; preds = %if.end, %if.end.us.us
  ret i32 0
}

define i32 @f4() nounwind uwtable readnone {
entry:
  ret i32 0
}

define i32 @main() nounwind uwtable {
entry:
  %i.i2 = alloca i32, align 4
  %i.i = alloca i32, align 4
  %call.i = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str, i64 0, i64 0), i32 16) nounwind
  %0 = bitcast i32* %i.i to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %0) nounwind
  br label %label.outer.i

label.outer.i:                                    ; preds = %if.then11.i, %entry
  %i2.ph.i = phi i32* [ %i.i, %if.then11.i ], [ null, %entry ]
  %1 = phi i32 [ %inc.lcssa.ph.us.i, %if.then11.i ], [ 0, %entry ]
  %tobool.i = icmp eq i32* %i2.ph.i, null
  br i1 %tobool.i, label %if.end.us.us.i, label %if.end.i.preheader

if.end.i.preheader:                               ; preds = %label.outer.i
  %tmp2.i19 = load i32* %i2.ph.i, align 4
  %call.i120 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %tmp2.i19) nounwind
  %cmp.i21 = icmp slt i32 %1, 3
  br i1 %cmp.i21, label %if.then5.i.lr.ph, label %f2.exit

if.then5.i.lr.ph:                                 ; preds = %if.end.i.preheader
  %tmp35 = sub i32 3, %1
  br label %if.then5.i

if.end.us.us.i:                                   ; preds = %label.outer.i
  %cmp.us.us.i = icmp slt i32 %1, 3
  br i1 %cmp.us.us.i, label %if.then11.i, label %f2.exit

if.then5.i:                                       ; preds = %if.then5.i, %if.then5.i.lr.ph
  %indvar21.i22 = phi i32 [ 0, %if.then5.i.lr.ph ], [ %indvar.next22.i, %if.then5.i ]
  %inc1.i23 = add i32 %1, %indvar21.i22
  store i32 %inc1.i23, i32* %i.i, align 4
  %indvar.next22.i = add i32 %indvar21.i22, 1
  %tmp2.i = load i32* %i2.ph.i, align 4
  %call.i1 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i64 0, i64 0), i32 %tmp2.i) nounwind
  %exitcond = icmp eq i32 %indvar.next22.i, %tmp35
  br i1 %exitcond, label %f2.exit, label %if.then5.i

if.then11.i:                                      ; preds = %if.end.us.us.i
  store i32 %1, i32* %i.i, align 4
  %inc.lcssa.ph.us.i = add i32 %1, 1
  br label %label.outer.i

f2.exit:                                          ; preds = %if.end.us.us.i, %if.end.i.preheader, %if.then5.i
  call void @llvm.lifetime.end(i64 -1, i8* %0) nounwind
  %2 = bitcast i32* %i.i2 to i8*
  call void @llvm.lifetime.start(i64 -1, i8* %2) nounwind
  br label %label.outer.i6

label.outer.i6:                                   ; preds = %if.then9.i, %f2.exit
  %i2.ph.i3 = phi i32* [ %i.i2, %if.then9.i ], [ null, %f2.exit ]
  %3 = phi i32 [ %inc.lcssa.ph.us.i17, %if.then9.i ], [ 0, %f2.exit ]
  %tobool.i5 = icmp eq i32* %i2.ph.i3, null
  br i1 %tobool.i5, label %if.end.us.us.i8, label %if.end.i14.preheader

if.end.i14.preheader:                             ; preds = %label.outer.i6
  %tmp2.i1125 = load i32* %i2.ph.i3, align 4
  %call.i1226 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %tmp2.i1125) nounwind
  store i32 5, i32* %i.i2, align 4
  %cmp.i1327 = icmp slt i32 %3, 3
  br i1 %cmp.i1327, label %if.then5.i16.lr.ph, label %f3.exit

if.then5.i16.lr.ph:                               ; preds = %if.end.i14.preheader
  %tmp40 = sub i32 3, %3
  br label %if.then5.i16

if.end.us.us.i8:                                  ; preds = %label.outer.i6
  store i32 5, i32* %i.i2, align 4
  %cmp.us.us.i7 = icmp slt i32 %3, 3
  br i1 %cmp.us.us.i7, label %if.then9.i, label %f3.exit

if.then5.i16:                                     ; preds = %if.then5.i16, %if.then5.i16.lr.ph
  %indvar21.i928 = phi i32 [ 0, %if.then5.i16.lr.ph ], [ %indvar.next22.i15, %if.then5.i16 ]
  %indvar.next22.i15 = add i32 %indvar21.i928, 1
  %tmp2.i11 = load i32* %i2.ph.i3, align 4
  %call.i12 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str2, i64 0, i64 0), i32 %tmp2.i11) nounwind
  store i32 5, i32* %i.i2, align 4
  %exitcond41 = icmp eq i32 %indvar.next22.i15, %tmp40
  br i1 %exitcond41, label %f3.exit, label %if.then5.i16

if.then9.i:                                       ; preds = %if.end.us.us.i8
  %inc.lcssa.ph.us.i17 = add i32 %3, 1
  br label %label.outer.i6

f3.exit:                                          ; preds = %if.end.us.us.i8, %if.end.i14.preheader, %if.then5.i16
  call void @llvm.lifetime.end(i64 -1, i8* %2) nounwind
  ret i32 0
}

declare void @llvm.lifetime.start(i64, i8* nocapture) nounwind

declare void @llvm.lifetime.end(i64, i8* nocapture) nounwind
