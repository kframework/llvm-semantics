; ModuleID = '/home/grosu/celliso2/c-semantics/tests/gcc-torture/pr42833.ll'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64"
target triple = "x86_64-unknown-linux-gnu"

define i32 @helper_neon_rshl_s8(i32 %arg1, i32 %arg2) nounwind uwtable readnone {
entry:
  %tmp97 = trunc i32 %arg2 to i8
  %cmp = icmp sgt i8 %tmp97, 7
  br i1 %cmp, label %do.body81, label %if.else

if.else:                                          ; preds = %entry
  %cmp21 = icmp slt i8 %tmp97, -8
  br i1 %cmp21, label %if.then23, label %if.else29

if.then23:                                        ; preds = %if.else
  %sext158 = shl i32 %arg1, 24
  %conv26 = ashr exact i32 %sext158, 24
  %shr10 = lshr i32 %conv26, 7
  %tmp = and i32 %shr10, 255
  br label %do.body81

if.else29:                                        ; preds = %if.else
  %cmp32 = icmp eq i8 %tmp97, -8
  br i1 %cmp32, label %if.then34, label %if.else50

if.then34:                                        ; preds = %if.else29
  %sext157 = shl i32 %arg1, 24
  %conv37 = ashr exact i32 %sext157, 24
  %conv39 = sext i8 %tmp97 to i32
  %sub = add nsw i32 %conv39, -1
  %shr40 = ashr i32 %conv37, %sub
  %inc = shl nsw i32 %shr40, 24
  %sext13 = add i32 %inc, 16777216
  %conv47 = ashr exact i32 %sext13, 24
  %shr489 = lshr i32 %conv47, 1
  %tmp17 = and i32 %shr489, 255
  br label %do.body81

if.else50:                                        ; preds = %if.else29
  %cmp53 = icmp slt i8 %tmp97, 0
  %sext147 = shl i32 %arg1, 24
  %conv58 = ashr exact i32 %sext147, 24
  %conv60 = sext i8 %tmp97 to i32
  br i1 %cmp53, label %if.then55, label %if.else68

if.then55:                                        ; preds = %if.else50
  %sub61 = xor i32 %conv60, -1
  %shl = shl i32 1, %sub61
  %add = add nsw i32 %shl, %conv58
  %sub64 = sub nsw i32 0, %conv60
  %shr65 = ashr i32 %add, %sub64
  %tmp21 = and i32 %shr65, 255
  br label %do.body81

if.else68:                                        ; preds = %if.else50
  %shl74 = shl i32 %conv58, %conv60
  %tmp26 = and i32 %shl74, 255
  br label %do.body81

do.body81:                                        ; preds = %entry, %if.then23, %if.then55, %if.else68, %if.then34
  %ins95145 = phi i32 [ %tmp, %if.then23 ], [ %tmp21, %if.then55 ], [ %tmp26, %if.else68 ], [ %tmp17, %if.then34 ], [ 0, %entry ]
  %tmp100 = lshr i32 %arg2, 8
  %tmp101 = trunc i32 %tmp100 to i8
  %cmp87 = icmp sgt i8 %tmp101, 7
  br i1 %cmp87, label %do.body160, label %if.else91

if.else91:                                        ; preds = %do.body81
  %cmp94 = icmp slt i8 %tmp101, -8
  br i1 %cmp94, label %if.then96, label %if.else103

if.then96:                                        ; preds = %if.else91
  %0 = shl i32 %arg1, 16
  %1 = ashr i32 %0, 23
  %tmp34 = and i32 %1, 65280
  %ins36 = or i32 %ins95145, %tmp34
  br label %do.body160

if.else103:                                       ; preds = %if.else91
  %cmp106 = icmp eq i8 %tmp101, -8
  br i1 %cmp106, label %if.then108, label %if.else126

if.then108:                                       ; preds = %if.else103
  %2 = shl i32 %arg1, 16
  %sext155 = ashr i32 %2, 24
  %conv113 = sext i8 %tmp101 to i32
  %sub114 = add nsw i32 %conv113, -1
  %shr115 = ashr i32 %sext155, %sub114
  %inc120 = shl nsw i32 %shr115, 24
  %sext12 = add i32 %inc120, 16777216
  %3 = ashr exact i32 %sext12, 17
  %tmp39 = and i32 %3, 65280
  %ins41 = or i32 %ins95145, %tmp39
  br label %do.body160

if.else126:                                       ; preds = %if.else103
  %cmp129 = icmp slt i8 %tmp101, 0
  %4 = shl i32 %arg1, 16
  %sext148 = ashr i32 %4, 24
  %conv136 = sext i8 %tmp101 to i32
  br i1 %cmp129, label %if.then131, label %if.else146

if.then131:                                       ; preds = %if.else126
  %sub137 = xor i32 %conv136, -1
  %shl138 = shl i32 1, %sub137
  %add139 = add nsw i32 %shl138, %sext148
  %sub142 = sub nsw i32 0, %conv136
  %shr143 = ashr i32 %add139, %sub142
  %tmp43 = shl i32 %shr143, 8
  %tmp44 = and i32 %tmp43, 65280
  %ins46 = or i32 %ins95145, %tmp44
  br label %do.body160

if.else146:                                       ; preds = %if.else126
  %shl152 = shl i32 %sext148, %conv136
  %tmp48 = shl i32 %shl152, 8
  %tmp49 = and i32 %tmp48, 65280
  %ins51 = or i32 %ins95145, %tmp49
  br label %do.body160

do.body160:                                       ; preds = %do.body81, %if.then96, %if.then131, %if.else146, %if.then108
  %ins95144 = phi i32 [ %ins36, %if.then96 ], [ %ins46, %if.then131 ], [ %ins51, %if.else146 ], [ %ins41, %if.then108 ], [ %ins95145, %do.body81 ]
  %tmp103 = lshr i32 %arg2, 16
  %tmp104 = trunc i32 %tmp103 to i8
  %cmp166 = icmp sgt i8 %tmp104, 7
  br i1 %cmp166, label %if.then168, label %if.else170

if.then168:                                       ; preds = %do.body160
  %mask53 = and i32 %ins95144, -16711681
  br label %do.body239

if.else170:                                       ; preds = %do.body160
  %cmp173 = icmp slt i8 %tmp104, -8
  br i1 %cmp173, label %if.then175, label %if.else182

if.then175:                                       ; preds = %if.else170
  %5 = shl i32 %arg1, 8
  %6 = ashr i32 %5, 15
  %tmp56 = and i32 %6, 16711680
  %mask57 = and i32 %ins95144, -16711681
  %ins58 = or i32 %mask57, %tmp56
  br label %do.body239

if.else182:                                       ; preds = %if.else170
  %cmp185 = icmp eq i8 %tmp104, -8
  br i1 %cmp185, label %if.then187, label %if.else205

if.then187:                                       ; preds = %if.else182
  %7 = shl i32 %arg1, 8
  %sext153 = ashr i32 %7, 24
  %conv192 = sext i8 %tmp104 to i32
  %sub193 = add nsw i32 %conv192, -1
  %shr194 = ashr i32 %sext153, %sub193
  %inc199 = shl nsw i32 %shr194, 24
  %sext11 = add i32 %inc199, 16777216
  %8 = ashr exact i32 %sext11, 9
  %tmp61 = and i32 %8, 16711680
  %mask62 = and i32 %ins95144, -16711681
  %ins63 = or i32 %mask62, %tmp61
  br label %do.body239

if.else205:                                       ; preds = %if.else182
  %cmp208 = icmp slt i8 %tmp104, 0
  %9 = shl i32 %arg1, 8
  %sext149 = ashr i32 %9, 24
  %conv215 = sext i8 %tmp104 to i32
  br i1 %cmp208, label %if.then210, label %if.else225

if.then210:                                       ; preds = %if.else205
  %sub216 = xor i32 %conv215, -1
  %shl217 = shl i32 1, %sub216
  %add218 = add nsw i32 %shl217, %sext149
  %sub221 = sub nsw i32 0, %conv215
  %shr222 = ashr i32 %add218, %sub221
  %tmp65 = shl i32 %shr222, 16
  %tmp66 = and i32 %tmp65, 16711680
  %mask67 = and i32 %ins95144, -16711681
  %ins68 = or i32 %mask67, %tmp66
  br label %do.body239

if.else225:                                       ; preds = %if.else205
  %shl231 = shl i32 %sext149, %conv215
  %tmp70 = shl i32 %shl231, 16
  %tmp71 = and i32 %tmp70, 16711680
  %mask72 = and i32 %ins95144, -16711681
  %ins73 = or i32 %mask72, %tmp71
  br label %do.body239

do.body239:                                       ; preds = %if.then175, %if.then210, %if.else225, %if.then187, %if.then168
  %ins95143 = phi i32 [ %ins58, %if.then175 ], [ %ins68, %if.then210 ], [ %ins73, %if.else225 ], [ %ins63, %if.then187 ], [ %mask53, %if.then168 ]
  %tmp106 = lshr i32 %arg2, 24
  %tmp107 = trunc i32 %tmp106 to i8
  %cmp245 = icmp sgt i8 %tmp107, 7
  br i1 %cmp245, label %if.then247, label %if.else249

if.then247:                                       ; preds = %do.body239
  %mask75 = and i32 %ins95143, 16777215
  br label %do.body318

if.else249:                                       ; preds = %do.body239
  %cmp252 = icmp slt i8 %tmp107, -8
  br i1 %cmp252, label %if.then254, label %if.else261

if.then254:                                       ; preds = %if.else249
  %10 = ashr i32 %arg1, 7
  %tmp78 = and i32 %10, -16777216
  %mask79 = and i32 %ins95143, 16777215
  %ins80 = or i32 %mask79, %tmp78
  br label %do.body318

if.else261:                                       ; preds = %if.else249
  %cmp264 = icmp eq i8 %tmp107, -8
  br i1 %cmp264, label %if.then266, label %if.else284

if.then266:                                       ; preds = %if.else261
  %tmp138 = ashr i32 %arg1, 24
  %conv271 = sext i8 %tmp107 to i32
  %sub272 = add nsw i32 %conv271, -1
  %shr273 = ashr i32 %tmp138, %sub272
  %inc278 = shl nsw i32 %shr273, 24
  %sext = add i32 %inc278, 16777216
  %11 = ashr exact i32 %sext, 1
  %tmp83 = and i32 %11, -16777216
  %mask84 = and i32 %ins95143, 16777215
  %ins85 = or i32 %mask84, %tmp83
  br label %do.body318

if.else284:                                       ; preds = %if.else261
  %cmp287 = icmp slt i8 %tmp107, 0
  %tmp141 = ashr i32 %arg1, 24
  %conv294 = sext i8 %tmp107 to i32
  br i1 %cmp287, label %if.then289, label %if.else304

if.then289:                                       ; preds = %if.else284
  %sub295 = xor i32 %conv294, -1
  %shl296 = shl i32 1, %sub295
  %add297 = add nsw i32 %shl296, %tmp141
  %sub300 = sub nsw i32 0, %conv294
  %shr301 = ashr i32 %add297, %sub300
  %tmp88 = shl i32 %shr301, 24
  %mask89 = and i32 %ins95143, 16777215
  %ins90 = or i32 %mask89, %tmp88
  br label %do.body318

if.else304:                                       ; preds = %if.else284
  %shl310 = shl i32 %tmp141, %conv294
  %tmp93 = shl i32 %shl310, 24
  %mask94 = and i32 %ins95143, 16777215
  %ins95 = or i32 %mask94, %tmp93
  br label %do.body318

do.body318:                                       ; preds = %if.then254, %if.then289, %if.else304, %if.then266, %if.then247
  %ins95146 = phi i32 [ %ins80, %if.then254 ], [ %ins90, %if.then289 ], [ %ins95, %if.else304 ], [ %ins85, %if.then266 ], [ %mask75, %if.then247 ]
  ret i32 %ins95146
}

define i32 @main() nounwind uwtable {
if.end:
  ret i32 0
}
