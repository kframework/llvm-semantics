; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/991201-1.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

%struct.vc = type { %struct.vc_data* }
%struct.vc_data = type { i64, [48 x i8] }

@a_con = common global %struct.vc_data zeroinitializer, align 8
@vc_cons = global [63 x %struct.vc] [%struct.vc { %struct.vc_data* @a_con }, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer, %struct.vc zeroinitializer], align 16
@default_red = common global [16 x i32] zeroinitializer, align 16
@default_grn = common global [16 x i32] zeroinitializer, align 16
@default_blu = common global [16 x i32] zeroinitializer, align 16

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

define void @reset_palette(i32 %currcons) nounwind uwtable {
entry:
  %idxprom6 = sext i32 %currcons to i64
  %d = getelementptr inbounds [63 x %struct.vc]* @vc_cons, i64 0, i64 %idxprom6, i32 0
  br label %for.body

for.body:                                         ; preds = %for.body, %entry
  %indvar = phi i64 [ 0, %entry ], [ %indvar.next, %for.body ]
  %arrayidx27 = getelementptr [16 x i32]* @default_blu, i64 0, i64 %indvar
  %arrayidx12 = getelementptr [16 x i32]* @default_grn, i64 0, i64 %indvar
  %arrayidx = getelementptr [16 x i32]* @default_red, i64 0, i64 %indvar
  %tmp5 = mul i64 %indvar, 3
  %tmp6 = add i64 %tmp5, 1
  %tmp7 = add i64 %tmp5, 2
  %tmp2 = load i32* %arrayidx, align 4
  %conv = trunc i32 %tmp2 to i8
  %tmp8 = load %struct.vc_data** %d, align 8
  %arrayidx9 = getelementptr %struct.vc_data* %tmp8, i64 0, i32 1, i64 %tmp5
  store i8 %conv, i8* %arrayidx9, align 1
  %tmp13 = load i32* %arrayidx12, align 4
  %conv14 = trunc i32 %tmp13 to i8
  %tmp22 = load %struct.vc_data** %d, align 8
  %arrayidx24 = getelementptr %struct.vc_data* %tmp22, i64 0, i32 1, i64 %tmp6
  store i8 %conv14, i8* %arrayidx24, align 1
  %tmp28 = load i32* %arrayidx27, align 4
  %conv29 = trunc i32 %tmp28 to i8
  %tmp37 = load %struct.vc_data** %d, align 8
  %arrayidx39 = getelementptr %struct.vc_data* %tmp37, i64 0, i32 1, i64 %tmp7
  store i8 %conv29, i8* %arrayidx39, align 1
  %indvar.next = add i64 %indvar, 1
  %exitcond = icmp eq i64 %indvar.next, 16
  br i1 %exitcond, label %bar.exit, label %for.body

bar.exit:                                         ; preds = %for.body
  ret void
}

define void @bar(i32 %k) nounwind uwtable {
entry:
  %cmp = icmp eq i32 %k, 48
  br i1 %cmp, label %if.end, label %if.then

if.then:                                          ; preds = %entry
  tail call void @abort() noreturn nounwind
  unreachable

if.end:                                           ; preds = %entry
  ret void
}

declare void @abort() noreturn nounwind

define i32 @main() noreturn nounwind uwtable {
entry:
  br label %for.body.i

for.body.i:                                       ; preds = %for.body.i, %entry
  %indvar.i = phi i64 [ 0, %entry ], [ %0, %for.body.i ]
  %tmp = mul i64 %indvar.i, 3
  %tmp1 = add i64 %tmp, 2
  %tmp2 = add i64 %tmp, 1
  %arrayidx.i = getelementptr [16 x i32]* @default_red, i64 0, i64 %indvar.i
  %arrayidx12.i = getelementptr [16 x i32]* @default_grn, i64 0, i64 %indvar.i
  %arrayidx27.i = getelementptr [16 x i32]* @default_blu, i64 0, i64 %indvar.i
  %tmp2.i = load i32* %arrayidx.i, align 4
  %conv.i = trunc i32 %tmp2.i to i8
  %tmp8.i = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16
  %arrayidx9.i = getelementptr %struct.vc_data* %tmp8.i, i64 0, i32 1, i64 %tmp
  store i8 %conv.i, i8* %arrayidx9.i, align 1
  %tmp13.i = load i32* %arrayidx12.i, align 4
  %conv14.i = trunc i32 %tmp13.i to i8
  %tmp22.i = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16
  %arrayidx24.i = getelementptr %struct.vc_data* %tmp22.i, i64 0, i32 1, i64 %tmp2
  store i8 %conv14.i, i8* %arrayidx24.i, align 1
  %tmp28.i = load i32* %arrayidx27.i, align 4
  %conv29.i = trunc i32 %tmp28.i to i8
  %tmp37.i = load %struct.vc_data** getelementptr inbounds ([63 x %struct.vc]* @vc_cons, i64 0, i64 0, i32 0), align 16
  %arrayidx39.i = getelementptr %struct.vc_data* %tmp37.i, i64 0, i32 1, i64 %tmp1
  store i8 %conv29.i, i8* %arrayidx39.i, align 1
  %0 = add i64 %indvar.i, 1
  %exitcond = icmp eq i64 %0, 16
  br i1 %exitcond, label %reset_palette.exit, label %for.body.i

reset_palette.exit:                               ; preds = %for.body.i
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn nounwind
