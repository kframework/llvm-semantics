; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/pr42833.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i32 @helper_neon_rshl_s8(i32 %arg1, i32 %arg2) nounwind uwtable readnone {
entry:
  %0 = trunc i32 %arg1 to i8
  %sroa.store.elt268 = lshr i32 %arg1, 8
  %1 = trunc i32 %sroa.store.elt268 to i8
  %sroa.store.elt269 = lshr i32 %arg1, 16
  %2 = trunc i32 %sroa.store.elt269 to i8
  %sroa.store.elt270 = lshr i32 %arg1, 24
  %3 = trunc i32 %sroa.store.elt270 to i8
  %sext = shl i32 %arg2, 24
  %conv = ashr exact i32 %sext, 24
  %cmp = icmp sgt i32 %sext, 117440512
  br i1 %cmp, label %do.body58, label %if.else

if.else:                                          ; preds = %entry
  %cmp10 = icmp slt i32 %sext, -134217728
  br i1 %cmp10, label %if.then12, label %if.else17

if.then12:                                        ; preds = %if.else
  %conv14 = sext i8 %0 to i32
  %shr = ashr i32 %conv14, 7
  br label %do.body58

if.else17:                                        ; preds = %if.else
  %cmp19 = icmp eq i32 %conv, -8
  br i1 %cmp19, label %do.body58, label %if.else33

if.else33:                                        ; preds = %if.else17
  %cmp35 = icmp slt i32 %sext, 0
  %conv39 = sext i8 %0 to i32
  br i1 %cmp35, label %if.then37, label %if.else47

if.then37:                                        ; preds = %if.else33
  %sub41 = xor i32 %conv, -1
  %shl = shl i32 1, %sub41
  %add = add nsw i32 %shl, %conv39
  %sub43 = sub nsw i32 0, %conv
  %shr44 = ashr i32 %add, %sub43
  br label %do.body58

if.else47:                                        ; preds = %if.else33
  %shl51 = shl i32 %conv39, %conv
  br label %do.body58

do.body58:                                        ; preds = %if.else17, %entry, %if.then12, %if.then37, %if.else47
  %vdest.0.0 = phi i32 [ %shr, %if.then12 ], [ %shr44, %if.then37 ], [ %shl51, %if.else47 ], [ 0, %entry ], [ 0, %if.else17 ]
  %4 = shl i32 %arg2, 16
  %sext271 = ashr i32 %4, 24
  %cmp62 = icmp sgt i32 %sext271, 7
  br i1 %cmp62, label %do.body122, label %if.else66

if.else66:                                        ; preds = %do.body58
  %cmp68 = icmp slt i32 %sext271, -8
  br i1 %cmp68, label %if.then70, label %if.else76

if.then70:                                        ; preds = %if.else66
  %conv72 = sext i8 %1 to i32
  %shr73 = ashr i32 %conv72, 7
  br label %do.body122

if.else76:                                        ; preds = %if.else66
  %cmp78 = icmp eq i32 %sext271, -8
  br i1 %cmp78, label %do.body122, label %if.else94

if.else94:                                        ; preds = %if.else76
  %cmp96 = icmp slt i32 %sext271, 0
  %conv100 = sext i8 %1 to i32
  br i1 %cmp96, label %if.then98, label %if.else110

if.then98:                                        ; preds = %if.else94
  %sub102 = xor i32 %sext271, -1
  %shl103 = shl i32 1, %sub102
  %add104 = add nsw i32 %shl103, %conv100
  %sub106 = sub nsw i32 0, %sext271
  %shr107 = ashr i32 %add104, %sub106
  br label %do.body122

if.else110:                                       ; preds = %if.else94
  %shl114 = shl i32 %conv100, %sext271
  br label %do.body122

do.body122:                                       ; preds = %if.else76, %do.body58, %if.then70, %if.then98, %if.else110
  %vdest.1.0 = phi i32 [ %shr73, %if.then70 ], [ %shr107, %if.then98 ], [ %shl114, %if.else110 ], [ 0, %do.body58 ], [ 0, %if.else76 ]
  %5 = shl i32 %arg2, 8
  %sext272 = ashr i32 %5, 24
  %cmp126 = icmp sgt i32 %sext272, 7
  br i1 %cmp126, label %do.body186, label %if.else130

if.else130:                                       ; preds = %do.body122
  %cmp132 = icmp slt i32 %sext272, -8
  br i1 %cmp132, label %if.then134, label %if.else140

if.then134:                                       ; preds = %if.else130
  %conv136 = sext i8 %2 to i32
  %shr137 = ashr i32 %conv136, 7
  br label %do.body186

if.else140:                                       ; preds = %if.else130
  %cmp142 = icmp eq i32 %sext272, -8
  br i1 %cmp142, label %do.body186, label %if.else158

if.else158:                                       ; preds = %if.else140
  %cmp160 = icmp slt i32 %sext272, 0
  %conv164 = sext i8 %2 to i32
  br i1 %cmp160, label %if.then162, label %if.else174

if.then162:                                       ; preds = %if.else158
  %sub166 = xor i32 %sext272, -1
  %shl167 = shl i32 1, %sub166
  %add168 = add nsw i32 %shl167, %conv164
  %sub170 = sub nsw i32 0, %sext272
  %shr171 = ashr i32 %add168, %sub170
  br label %do.body186

if.else174:                                       ; preds = %if.else158
  %shl178 = shl i32 %conv164, %sext272
  br label %do.body186

do.body186:                                       ; preds = %if.else140, %do.body122, %if.then134, %if.then162, %if.else174
  %vdest.2.0 = phi i32 [ %shr137, %if.then134 ], [ %shr171, %if.then162 ], [ %shl178, %if.else174 ], [ 0, %do.body122 ], [ 0, %if.else140 ]
  %sroa.store.elt267 = ashr i32 %arg2, 24
  %cmp191 = icmp sgt i32 %sroa.store.elt267, 7
  br i1 %cmp191, label %do.body251, label %if.else195

if.else195:                                       ; preds = %do.body186
  %cmp197 = icmp slt i32 %sroa.store.elt267, -8
  br i1 %cmp197, label %if.then199, label %if.else205

if.then199:                                       ; preds = %if.else195
  %conv201 = sext i8 %3 to i32
  %shr202 = ashr i32 %conv201, 7
  br label %do.body251

if.else205:                                       ; preds = %if.else195
  %cmp207 = icmp eq i32 %sroa.store.elt267, -8
  br i1 %cmp207, label %do.body251, label %if.else223

if.else223:                                       ; preds = %if.else205
  %cmp225 = icmp slt i32 %sroa.store.elt267, 0
  %conv229 = sext i8 %3 to i32
  br i1 %cmp225, label %if.then227, label %if.else239

if.then227:                                       ; preds = %if.else223
  %sub231 = xor i32 %sroa.store.elt267, -1
  %shl232 = shl i32 1, %sub231
  %add233 = add nsw i32 %conv229, %shl232
  %sub235 = sub nsw i32 0, %sroa.store.elt267
  %shr236 = ashr i32 %add233, %sub235
  br label %do.body251

if.else239:                                       ; preds = %if.else223
  %shl243 = shl i32 %conv229, %sroa.store.elt267
  br label %do.body251

do.body251:                                       ; preds = %if.else205, %do.body186, %if.then199, %if.then227, %if.else239
  %vdest.3.0 = phi i32 [ %shr202, %if.then199 ], [ %shr236, %if.then227 ], [ %shl243, %if.else239 ], [ 0, %do.body186 ], [ 0, %if.else205 ]
  %6 = and i32 %vdest.0.0, 255
  %7 = shl i32 %vdest.1.0, 8
  %8 = and i32 %7, 65280
  %9 = shl i32 %vdest.2.0, 16
  %10 = and i32 %9, 16711680
  %11 = shl i32 %vdest.3.0, 24
  %12 = or i32 %8, %6
  %13 = or i32 %12, %10
  %14 = or i32 %13, %11
  ret i32 %14
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
